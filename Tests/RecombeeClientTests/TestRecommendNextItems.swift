import RecombeeClient
import XCTest

final class RecommendNextItemsTests: RecombeeTestCase {
    func testRecommendNextItems() async throws {
        let client = getRecombeeClient()

        do {
            // Step 1: Send RecommendItemsToUser
            let firstResponse = try await client.send(
                RecommendItemsToUser(userId: "user-1", count: 5)
            )

            XCTAssertEqual(firstResponse.recomms.count, 5, "Expected 5 initial recommendations")

            // Step 2: Send RecommendNextItems using recommId
            let nextResponse = try await client.send(
                RecommendNextItems(recommId: firstResponse.recommId, count: 5)
            )

            XCTAssertEqual(nextResponse.recomms.count, 5, "Expected 5 next recommendations")

        } catch let error as ClientError {
            XCTFail("ClientError: \(error.errorDescription ?? "Unknown client error")")
        } catch {
            XCTFail("Unexpected error: \(error.localizedDescription)")
        }
    }
}
