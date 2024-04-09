//
//  SwiftyGPTMessage.swift
//
//
//  Created by Antonio Guerra on 09/04/24.
//

import Foundation

protocol SwiftyGPTMessage {
    var role: SwiftyGPTRole { get }
    var content: String { get }
}
