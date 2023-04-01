//
//  SwiftyGPT+Image.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import UIKit
import SwiftyHTTP
import SwiftyRanged

// MARK: - Image
extension SwiftyGPT {
    
    public func image(prompt: String, @SwiftyRanged(1...10) choices: Int, size: SwiftyGPTImageSize? = nil, user: String? = nil, completion: @escaping (Result<[UIImage], Error>) -> ()) {
        
        let request = SwiftyGPTImageRequest(prompt: prompt, choices: choices, size: size, responseFormat: .b64, user: user)
        SwiftyHTTP.request(SwiftyGPTRouter.image(apiKey, request)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let body = try? JSONDecoder().decode(SwiftyGPTImageResponse<SwiftyGPTB64ResponseData>.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    completion(.success(body.data.compactMap({ Data(base64Encoded: $0.b64) }).compactMap({ UIImage(data: $0)})))
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
    
    public func image(prompt: String, @SwiftyRanged(1...10) choices: Int, size: SwiftyGPTImageSize? = nil, user: String? = nil) async -> Result<[UIImage], Error> {
        
        return await withCheckedContinuation { continuation in
            image(prompt: prompt, choices: choices, size: size, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    public func image(prompt: String, size: SwiftyGPTImageSize? = nil, user: String? = nil, completion: @escaping (Result<UIImage, Error>) -> ()) {
        image(prompt: prompt, choices: 1, size: size, user: user) { result in
            switch result {
            case .success(let images):
                if let image = images.first {
                    completion(.success(image))
                } else {
                    completion(.failure(URLError(.badURL)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func image(prompt: String, size: SwiftyGPTImageSize? = nil, user: String? = nil) async -> Result<UIImage, Error> {
        return await withCheckedContinuation { continuation in
            image(prompt: prompt, size: size, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
