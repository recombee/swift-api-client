import RecombeeClient
import XCTest

final class RecommendNextItemSegmentsTests: RecombeeTestCase {
    func testRecommendNextItems() async throws {
        let client = getRecombeeClient()

        do {
            // Step 1: Send RecommendItemSegmentsToItem
            let firstResponse = try await client.send(
                RecommendItemSegmentsToItem(itemId: "computer-1", targetUserId: "user-1", count: 5, scenario: "is-to-i")
            )

            XCTAssertEqual(firstResponse.recomms.count, 5, "Expected 5 initial recommendations")

            // Step 2: Send RecommendNextItemSegments using recommId
            let nextResponse = try await client.send(
                RecommendNextItemSegments(recommId: firstResponse.recommId, count: 5)
            )

            XCTAssertEqual(nextResponse.recomms.count, 5, "Expected 5 next recommendations")

        } catch let error as ClientError {
            XCTFail("ClientError: \(error.errorDescription ?? "Unknown client error")")
        } catch {
            XCTFail("Unexpected error: \(error.localizedDescription)")
        }
    }
}
