/// A region specifies the data center location of your Recombee database.
///
/// Use the appropriate region when initializing the `RecombeeClient` to ensure requests are sent to the correct endpoint.
public enum Region: String {
    case apSe = "client-rapi-ap-se.recombee.com"
    case caEast = "client-rapi-ca-east.recombee.com"
    case euWest = "client-rapi-eu-west.recombee.com"
    case usWest = "client-rapi-us-west.recombee.com"
}
