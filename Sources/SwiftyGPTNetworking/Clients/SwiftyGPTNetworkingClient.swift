//
//  SwiftyGPTNetworkingClient.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public struct SwiftyGPTNetworkingClient {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func send(request: SwiftyGPTNetworkingRequest) async throws -> SwiftyGPTNetworkingResponse {
        let (body, underlyingResponse) = try await session.data(for: request.underlyingRequest)
        guard let underlyingResponse = underlyingResponse as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return SwiftyGPTNetworkingResponse(underlyingResponse: underlyingResponse, body: body)
    }
}
