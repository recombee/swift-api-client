/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class RecommendItemsToItemSegmentTests: RecombeeTestCase {
    func testRecommendItemsToItemSegment() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a RecommendItemsToItemSegment request
        let request = RecommendItemsToItemSegment(contextSegmentId: "3", targetUserId: "user-1", count: 5, scenario: "i-to-is")

        do {
            // Call the send method
            let response = try await client.send(request)
            XCTAssertEqual(response.recomms.count, 5)

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testRecommendItemsToItemSegmentInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a RecommendItemsToItemSegment request in a Batch
        let request = Batch(requests: [RecommendItemsToItemSegment(contextSegmentId: "3", targetUserId: "user-1", count: 5, scenario: "i-to-is")])

        do {
            // Call the send method
            let batchResponses = try await client.send(request)
            let responseWrapper = batchResponses[0]

            // Check that the status code is in 200...299 range
            XCTAssert((200 ... 299).contains(responseWrapper.statusCode), "Unexpected HTTP status code: \(responseWrapper.statusCode)")

            let batchResponse = try responseWrapper.response
            if let response = try? batchResponse?.decode(as: RecommendationResponse.self) {
                XCTAssertEqual(response.recomms.count, 5)
            }

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }
}
