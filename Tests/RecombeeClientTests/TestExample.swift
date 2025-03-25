import RecombeeClient
import XCTest

final class TestExample: RecombeeTestCase {
    func testExample() async {
        // Initialize the API client with the ID of your database and the associated PUBLIC token
        let client = getRecombeeClient()

        do {
            // Send interactions
            client.sendDetached(
                AddCartAddition(
                    userId: "user-4395",
                    itemId: "item-129",
                    recommId: "23eaa09b-0e24-4487-ba9c-8e255feb01bb"
                )
            )

            // Request recommendations
            let response = try await client.send(
                RecommendItemsToUser(
                    userId: "user-x",
                    count: 10,
                    scenario: "i-to-u",
                    returnProperties: true,
                    includedProperties: ["description"]
                )
            )

            // `recommId` needs to be sent with interactions
            print("recommId: \(response.recommId)")

            // The `recomms` object contains the `id` (and `values` if `returnProperties` is true)
            for item in response.recomms {
                let description = item.values?["description"] as? String ?? "(unknown)"
                print("ID: \(item.id), Description: \(description)")
            }

        } catch let error as ClientError {
            print("ClientError: \(error.errorDescription ?? "Unknown error")")
            // Ideally, provide a fallback if an error occurs...
        } catch {
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
}
