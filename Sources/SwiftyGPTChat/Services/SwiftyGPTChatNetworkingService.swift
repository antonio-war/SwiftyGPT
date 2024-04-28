//
//  SwiftyGPTChatNetworkingService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation
import SwiftyGPTNetworking

public struct SwiftyGPTChatNetworkingService: SwiftyGPTChatService {
    public let client: SwiftyGPTNetworkingClient
    public let encoder: JSONEncoder
    public let decoder: JSONDecoder
    public let apiKey: String
    public let organization: String?
    
    public init(client: SwiftyGPTNetworkingClient = SwiftyGPTNetworkingClient(session: URLSession.shared), encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder(), apiKey: String, organization: String? = nil) {
        self.client = client
        self.encoder = encoder
        self.decoder = decoder
        self.apiKey = apiKey
        self.organization = organization
    }
    
    public func request(body: SwiftyGPTChatRequestBody) async throws -> any SwiftyGPTChatResponseBody {
        let body = try JSONEncoder().encode(body)
        let request = SwiftyGPTChatRequest(apiKey: apiKey, organization: organization, body: body)
        let response = try await client.send(request: request)
        switch response.statusCode {
        case 200..<300:
            return try decoder.decode(SwiftyGPTChatResponseSuccessBody.self, from: response.body)
        default:
            return try decoder.decode(SwiftyGPTChatResponseFailureBody.self, from: response.body)
        }
    }
}
