//
//  MessageView.swift
//  Explorer
//
//  Created by Antonio Guerra on 28/04/24.
//

import SwiftUI
import SwiftyGPTChat

struct MessageView: View {
    private var message: any SwiftyGPTChatMessage
    
    init(message: any SwiftyGPTChatMessage) {
        self.message = message
    }
    
    var body: some View {
        switch message {
        case let message as SwiftyGPTChatUserMessage:
            sentMessageView(content: message.content)
        case let message as SwiftyGPTChatAssistantMessage:
            receivedMessageView(content: message.content)
        case let message as SwiftyGPTChatToolMessage:
            receivedMessageView(content: message.content)
        default:
            let message = message as! SwiftyGPTChatSystemMessage
            receivedMessageView(content: message.content)
        }
    }
    
    private func sentMessageView(content: String) -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            Spacer()
            Text(content)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private func receivedMessageView(content: String) -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            Text(content)
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview("Sent message") {
    MessageView(message: SwiftyGPTChatUserMessage(content: "Hello, how are you ?"))
}

#Preview("Received message") {
    MessageView(message: SwiftyGPTChatSystemMessage(content: "Hello! I'm fine and you ?"))
}
