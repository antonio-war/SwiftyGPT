//
//  ExplorerApp.swift
//  Explorer
//
//  Created by Antonio Guerra on 27/04/24.
//

import SwiftUI
import SwiftyGPTChat

@main
struct ExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView(environment: environment)
        }
    }
    
    private var environment: Environment {
        #if DEBUG
            if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
                return Environment.test
            } else if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                return Environment.preview
            } else {
                return Environment.debug
            }
        #else
            return Environment.release
        #endif
    }
    
    enum Environment {
        case release
        case debug
        case test
        case preview
    }
}
