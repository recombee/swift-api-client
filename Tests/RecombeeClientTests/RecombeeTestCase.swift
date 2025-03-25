import RecombeeClient
import XCTest

class RecombeeTestCase: XCTestCase {
    func getRecombeeClient() -> RecombeeClient {
        return RecombeeClient(
            databaseId: "tst-public-key",
            publicToken: "dIuCAwTeXn87m24HYE6uAIwSVzgEkTrQflrYlDBeIoeTIrhG1FVqj1v0h6u3nNSu",
            region: .euWest
        )
    }
}
