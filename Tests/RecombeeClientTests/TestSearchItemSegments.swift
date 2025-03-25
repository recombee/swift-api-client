/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class SearchItemSegmentsTests: RecombeeTestCase {
    func testSearchItemSegments() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a SearchItemSegments request
        let request = SearchItemSegments(userId: "user-1", searchQuery: "computer", count: 5, scenario: "s-is")

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

    func testSearchItemSegmentsInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a SearchItemSegments request in a Batch
        let request = Batch(requests: [SearchItemSegments(userId: "user-1", searchQuery: "computer", count: 5, scenario: "s-is")])

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
