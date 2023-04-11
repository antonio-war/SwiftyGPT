//
//  SwiftyGPTModel.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation

protocol SwiftyGPTModel: Codable {
    static var stable: Self { get }
}
