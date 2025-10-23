/*
 This file is auto-generated
 */

import RecombeeClient
import XCTest

final class CompositeRecommendationTests: RecombeeTestCase {
    func testCompositeRecommendation() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a CompositeRecommendation request
        let request = CompositeRecommendation(scenario: "composite-i-i", count: 10, resultSettings: CompositeRecommendationStageParameters(returnProperties: true, filter: "'num-cores' > 3"))

        do {
            // Call the send method
            let response = try await client.send(request)

        } catch let error as ClientError {
            XCTFail("Request failed with client error: \(error.errorDescription ?? "No description available.")")
        } catch {
            XCTFail("Request failed with unexpected error: \(error.localizedDescription)")
        }
    }

    func testCompositeRecommendationInBatch() async throws {
        // Initialize the RecombeeClient
        let client = getRecombeeClient()

        // Create a CompositeRecommendation request in a Batch
        let request = Batch(requests: [CompositeRecommendation(scenario: "composite-i-i", count: 10, resultSettings: CompositeRecommendationStageParameters(returnProperties: true, filter: "'num-cores' > 3"))])

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
