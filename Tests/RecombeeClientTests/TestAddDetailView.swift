/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class AddDetailViewTests: RecombeeTestCase {
    func testAddDetailView() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a AddDetailView request
        let request = AddDetailView(userId: "user-1", itemId: "item-1")

        do {
            // Call the send method
            let response = try await client.send(request)

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testAddDetailViewInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a AddDetailView request in a Batch
        let request = Batch(requests: [AddDetailView(userId: "user-1", itemId: "item-1")])

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
