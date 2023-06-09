//
//  SwiftyGPTError.swift
//  
//
//  Created by Antonio Guerra on 29/03/23.
//

import Foundation

public struct SwiftyGPTError: Error, Decodable {
    let message, type: String
    let code: String?
    
    enum WrapperCodingKeys: CodingKey {
        case error
    }
    
    enum CodingKeys: CodingKey {
        case message
        case type
        case code
    }
    
    public init(from decoder: Decoder) throws {
        let wrapper = try decoder.container(keyedBy: WrapperCodingKeys.self)
        let container = try wrapper.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.type = try container.decode(String.self, forKey: .type)
        self.code = try container.decode(String?.self, forKey: .code)
    }
}
