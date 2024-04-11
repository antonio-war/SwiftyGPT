//
//  SwiftyGPTChatResponseBody.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatResponseBody: Identifiable, Decodable {
    let id: String
    // TODO: add choices
    let created: Date
    let model: SwiftyGPTChatModel
    let fingerprint: String
    let object: String = "chat.completion"
    // TODO: add usage
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case model
        case fingerprint = "system_fingerprint"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.created = try Date(timeIntervalSince1970: container.decode(TimeInterval.self, forKey: .created))
        self.model = try container.decode(SwiftyGPTChatModel.self, forKey: .model)
        self.fingerprint = try container.decode(String.self, forKey: .fingerprint)
    }
}
