//
//  SwiftyGPTChatModel.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public enum SwiftyGPTChatModel: String, Codable {
    case gpt4_turbo = "gpt-4-turbo"
    case gpt4_turbo_preview = "gpt-4-turbo-preview"
    case gpt4_0125_preview = "gpt-4-0125-preview"
    case gpt4_1106_preview = "gpt-4-1106-preview"
    case gpt4 = "gpt-4"
    case gpt4_0613 = "gpt-4-0613"
    case gpt4_32k = "gpt-4-32k"
    case gpt4_32k_0613 = "gpt-4-32k-0613"
    case gpt3_5_turbo_0125 = "gpt-3.5-turbo-0125"
    case gpt3_5_turbo = "gpt-3.5-turbo"
    case gpt3_5_turbo_0301 = "gpt-3.5-turbo-0301"
    case gpt3_5_turbo_1106 = "gpt-3.5-turbo-1106"
    case gpt3_5_turbo_16k = "gpt-3.5-turbo-16k"
    case gpt3_5_turbo_0613 = "gpt-3.5-turbo-0613"
    case gpt3_5_turbo_16k_0613 = "gpt-3.5-turbo-16k-0613"
}
