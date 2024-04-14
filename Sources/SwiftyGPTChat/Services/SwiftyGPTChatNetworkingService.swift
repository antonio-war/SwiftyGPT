//
//  SwiftyGPTChatNetworkingService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation
import SwiftyGPTNetworking

struct SwiftyGPTChatNetworkingService: SwiftyGPTChatService {
    private let client: SwiftyGPTNetworkingClient
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let apiKey: String
    private let organization: String?
    
    init(client: SwiftyGPTNetworkingClient = SwiftyGPTNetworkingClient(session: URLSession.shared), encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder(), apiKey: String, organization: String?) {
        self.client = client
        self.encoder = encoder
        self.decoder = decoder
        self.apiKey = apiKey
        self.organization = organization
    }
    
    func request(body: SwiftyGPTChatRequestBody) async throws -> any SwiftyGPTChatResponseBody {
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
