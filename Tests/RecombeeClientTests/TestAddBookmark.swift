/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class AddBookmarkTests: RecombeeTestCase {
    func testAddBookmark() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a AddBookmark request
        let request = AddBookmark(userId: "user-1", itemId: "item-1")

        do {
            // Call the send method
            let response = try await client.send(request)

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testAddBookmarkInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a AddBookmark request in a Batch
        let request = Batch(requests: [AddBookmark(userId: "user-1", itemId: "item-1")])

        do {
            // Call the send method
            let batchResponses = try await client.send(request)
            let responseWrapper = batchResponses[0]

            // Check that the status code is in 200...299 range
            XCTAssert((200 ... 299).contains(responseWrapper.statusCode), "Unexpected HTTP status code: \(responseWrapper.statusCode)")

            let batchResponse = try responseWrapper.response
            if let response = try? batchResponse?.decode(as: RecommendationResponse.self) {}

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }
}
