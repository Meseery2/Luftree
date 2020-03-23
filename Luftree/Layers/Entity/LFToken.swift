import Foundation

struct Token: Codable {
    var accessToken: String?
    var tokenType: String?
    var expiry: Int?

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiry = "expires_in"
    }

    var authToken: String? {
        return tokenType?
            .capitalized
            .appending(" ")
            .appending(accessToken ?? "")
    }
}
