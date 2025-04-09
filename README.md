  <div align="center">
  <img
    src="https://raw.githubusercontent.com/recombee/.github/refs/heads/main/assets/mark.svg"
    width="64px"
    align="center"
    alt="Recombee"
  />
  <br />
  <h1>Recombee Swift API Client</h1>
</div>

<p align="center">
<a href="https://swiftpackageindex.com/recombee/swift-api-client" rel="nofollow"><img src="https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg" alt="SwiftPM"></a>
<a href="https://opensource.org/licenses/MIT" rel="nofollow"><img src="https://img.shields.io/github/license/recombee/swift-api-client" alt="License"></a>
</p>

<div align="center">
  <a href="https://docs.recombee.com/swift_client">Documentation</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://github.com/recombee/swift-api-client/issues/new">Issues</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="mailto:support@recombee.com">Support</a>
  <br />
</div>

## ✨ Features

- Thin Swift wrapper around the Recombee API
- Supports following endpoints: [Interactions](https://docs.recombee.com/api#user-item-interactions), [Recommendations](https://docs.recombee.com/api#recommendations), [Search](https://docs.recombee.com/api#search), and more
- Fully async/await enabled for modern iOS development
- Typed request/response interfaces with JSON decoding helpers

## 🚀 Getting Started

Add the dependency to your Xcode project using **Swift Package Manager**:

1. In Xcode, go to `File → Add Packages`
2. Enter the repository URL:

```
https://github.com/recombee/swift-api-client
```

3. Choose the latest version and confirm

Alternatively, in `Package.swift`:

```swift
.package(url: "https://github.com/recombee/swift-api-client", from: "5.0.2")
```

Then add to your target dependencies:

```swift
.target(
  name: "MyApp",
  dependencies: ["RecombeeClient"]
)
```

## 🏗️ Example

You can send user-item interactions and receive recommendations like this:

```swift
import RecombeeClient

// Initialize the API client with the ID of your database and the associated PUBLIC token
let client = RecombeeClient(
    databaseId: "your-database-id",
    publicToken: "...db-public-token...",
    region: .euWest // the region of your database
)

do {
    // Send interactions
    try await client.send(
        AddDetailView(
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
            scenario: "homepage-top-for-you",
            returnProperties: true,
            includedProperties: ["title"]
        )
    )

    // `recommId` needs to be sent with interactions based on recommendations
    print("recommId: \(response.recommId)")

    // The `recomms` object contains the `id` (and `values` if `returnProperties` is true)
    for item in response.recomms {
        let title = item.values?["title"] as? String ?? "(unknown)"
        print("ID: \(item.id), Title: \(title)")
    }

} catch let error as ClientError {
    print("ClientError: \(error.errorDescription ?? "Unknown error")")
    // Ideally, provide a fallback if an error occurs...
} catch {
    print("Unexpected error: \(error.localizedDescription)")
}
```

> [!TIP]
> We also published a simple [example iOS app](https://github.com/recombee/ios-demo) to help you with the integration. Feel free to use it as a reference.
>
> ![iOS Demo app](https://raw.githubusercontent.com/recombee/ios-demo/refs/heads/main/images/screenshots.png)

## 📝 Documentation

Discover the full [Swift API Client documentation](https://docs.recombee.com/swift_client) for comprehensive guides and examples.

For a complete breakdown of all endpoints and their responses, check out our [API Reference](https://docs.recombee.com/api).

## 🤝 Contributing

We welcome all contributions—whether it’s fixing a bug, improving documentation, or suggesting a new feature.

To contribute, simply fork the repository, make your changes, and submit a pull request. Be sure to provide a clear description of your changes.

Thanks for helping make this project better!

## 🔧 Troubleshooting

Are you having issues? We recommend checking [our documentation](https://docs.recombee.com/swift_client) to see if it contains a possible solution.

If you want to reach out, you can either [open a GitHub issue](https://github.com/recombee/swift-api-client/issues/new) or send an email to support@recombee.com.


We're happy to help!

## 📄 License

The Recombee Swift API Client is provided under the [MIT License](https://opensource.org/licenses/MIT).
