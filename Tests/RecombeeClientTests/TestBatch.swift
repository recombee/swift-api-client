import RecombeeClient
import XCTest

final class BatchTests: RecombeeTestCase {
    func testBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a Batch request
        let requests: [any Request] = [
            AddBookmark(userId: "user-1", itemId: "item-1"),
            SearchItems(userId: "user-1", searchQuery: "computer", count: 5),
            RecommendItemsToItem(itemId: "item-1", targetUserId: "user-1", count: 5, filter: "true or false"),
            RecommendItemSegmentsToItemSegment(contextSegmentId: "3", targetUserId: "user-1", count: 5, scenario: "is-to-is"),
        ]

        let batchRequest = Batch(requests: requests)

        do {
            let batchResponse = try await client.send(batchRequest)

            for (index, individualResponse) in batchResponse.enumerated() {
                let statusCode = individualResponse.statusCode
                XCTAssert(
                    (200 ... 299).contains(statusCode),
                    "Response \(index) returned status code \(statusCode), expected 2xx"
                )

                let decodedResponse = try individualResponse.response

                if index == 0 {
                    // AddBookmark – should NOT decode as RecommendationResponse
                    let decodedAsRecommendation = try? decodedResponse?.decode(as: RecommendationResponse.self)
                    XCTAssertNil(
                        decodedAsRecommendation,
                        "Response \(index) (AddBookmark) unexpectedly decoded as RecommendationResponse"
                    )
                } else {
                    // All other responses – should decode as RecommendationResponse
                    guard let recommResponse = try decodedResponse?.decode(as: RecommendationResponse.self) else {
                        return XCTFail("Response \(index) did not decode as RecommendationResponse")
                    }

                    XCTAssertEqual(
                        recommResponse.recomms.count,
                        5,
                        "Response \(index) returned \(recommResponse.recomms.count) recommendations, expected 5"
                    )
                }
            }

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testBatchWithOneInvalidRequest() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        let validRequest = AddBookmark(userId: "user-1", itemId: "item-1")
        let invalidRequest = RecommendItemSegmentsToItemSegment(
            contextSegmentId: "3",
            targetUserId: "user-1",
            count: 5
        ) // Missing scenario parameter

        let batch = Batch(requests: [validRequest, invalidRequest])

        do {
            let responses = try await client.send(batch)

            // Check first response (valid)
            let first = responses[0]
            XCTAssert((200 ... 299).contains(first.statusCode), "Expected 2xx status code for first request, got \(first.statusCode)")
            XCTAssertNoThrow(try first.response, "Expected first response to decode successfully")

            // Check second response (expected to fail)
            let second = responses[1]
            XCTAssertEqual(second.statusCode, 400, "Expected 400 status code for invalid request, got \(second.statusCode)")

            XCTAssertThrowsError(try second.response) { error in
                guard let clientError = error as? ClientError else {
                    return XCTFail("Expected ClientError, got \(type(of: error))")
                }

                switch clientError {
                case let .responseError(_, statusCode, _):
                    XCTAssertEqual(statusCode, 400, "Expected .responseError with status 400, got \(statusCode)")
                default:
                    XCTFail("Expected .responseError, got \(clientError)")
                }
            }

        } catch let error as ClientError {
            XCTFail("Batch failed entirely with ClientError: \(error.errorDescription ?? "Unknown error")")
        } catch {
            XCTFail("Unexpected top-level error: \(error)")
        }
    }
}
