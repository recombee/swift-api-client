/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class RecommendItemSegmentsToItemSegmentTests: RecombeeTestCase {
    func testRecommendItemSegmentsToItemSegment() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a RecommendItemSegmentsToItemSegment request
        let request = RecommendItemSegmentsToItemSegment(contextSegmentId: "3", targetUserId: "user-1", count: 5, scenario: "is-to-is")

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

    func testRecommendItemSegmentsToItemSegmentInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a RecommendItemSegmentsToItemSegment request in a Batch
        let request = Batch(requests: [RecommendItemSegmentsToItemSegment(contextSegmentId: "3", targetUserId: "user-1", count: 5, scenario: "is-to-is")])

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
