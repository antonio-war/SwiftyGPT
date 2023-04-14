//
//  SwiftyGPTSentiment.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import Foundation

public enum SwiftyGPTSentiment: String, Codable {
    case positive
    case neutral
    case negative
    
    var intValue: Int {
        switch self {
        case .positive:
            return 1
        case .neutral:
            return 0
        case .negative:
            return -1
        }
    }
}
