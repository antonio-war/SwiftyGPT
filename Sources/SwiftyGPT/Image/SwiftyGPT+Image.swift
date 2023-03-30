//
//  SwiftyGPT+Image.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import SwiftyHTTP
import SwiftyRanged

// MARK: - Image
extension SwiftyGPT {
    public func image(prompt: String, @SwiftyRanged(1...10) quantity: Int, size: SwiftyGPTImageSize? = nil, user: String? = nil, completion: @escaping (Result<[Data], Error>) -> ()) {
        
        let request = SwiftyGPTImageRequest(prompt: prompt, quantity: quantity, size: size, responseFormat: .b64, user: user)
        SwiftyHTTP.request(with: SwiftyGPTRouter.image(apiKey, request)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let body = try? JSONDecoder().decode(SwiftyGPTImageResponse<SwiftyGPTB64ResponseData>.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    completion(.success(body.data.compactMap({ Data(base64Encoded: $0.b64) })))
                } else {
                    guard let error = try? JSONDecoder().decode(SwiftyGPTError.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
