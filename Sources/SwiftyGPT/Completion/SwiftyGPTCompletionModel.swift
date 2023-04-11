//
//  SwiftyGPTCompletionModel.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation

public enum SwiftyGPTCompletionModel: String, SwiftyGPTModel {
    
    case ada
    case text_ada_001 = "text-ada-001"
    
    case babbage
    case text_babbage_001 = "text-babbage-001"
    
    case curie
    case text_curie_001 = "text-curie-001"
    
    case davinci
    case text_davinci_002 = "text-davinci-002"
    case text_davinci_003 = "text-davinci-003"
    
    public static var stable: SwiftyGPTCompletionModel {
        .text_davinci_003
    }
}
