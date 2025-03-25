/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class SetViewPortionTests: RecombeeTestCase {
    func testSetViewPortion() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a SetViewPortion request
        let request = SetViewPortion(userId: "user-1", itemId: "item-1", portion: 0.5, sessionId: (1 ... 16).map { _ in String("abcdefghijklmnopqrstuvwxyz".randomElement()!) }.joined(), timestamp: ISO8601DateFormatter().date(from: "2023-03-16T14:45:30Z"))

        do {
            // Call the send method
            let response = try await client.send(request)

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testSetViewPortionInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a SetViewPortion request in a Batch
        let request = Batch(requests: [SetViewPortion(userId: "user-1", itemId: "item-1", portion: 0.5, sessionId: (1 ... 16).map { _ in String("abcdefghijklmnopqrstuvwxyz".randomElement()!) }.joined(), timestamp: ISO8601DateFormatter().date(from: "2023-03-16T14:45:30Z"))])

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
