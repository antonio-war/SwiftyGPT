//
//  ChatView.swift
//  Explorer
//
//  Created by Antonio Guerra on 28/04/24.
//

import SwiftUI
import SwiftyGPTChat

struct ChatView: View {
    private let environment: ExplorerApp.Environment
    @State private var messages: [any SwiftyGPTChatMessage]
    @State private var typedMessage: String
    
    init(environment: ExplorerApp.Environment, messages: [any SwiftyGPTChatMessage] = [], typedMessage: String = "") {
        self.environment = environment
        self.messages = messages
        self.typedMessage = typedMessage
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: .zero) {
                ForEach(messages, id: \.id) { message in
                    MessageView(message: message)
                }
            }
        }
        typingView
    }
    
    private var typingView: some View {
        HStack {
            TextField("Send a message...", text: $typedMessage)
                .textFieldStyle(.roundedBorder)
            Button(action: sendMessage )   {
                Image(systemName: "paperplane")
                    .padding(5)
                    .foregroundStyle(Color.white)
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
            .disabled(typedMessage.isEmpty)
        }
        .padding()
    }
    
    private var manager: SwiftyGPTChatManager {
        return SwiftyGPTChatManager(service: service)
    }
    
    private var service: any SwiftyGPTChatService {
        switch environment {
//        case .release, .debug:
//            return SwiftyGPTChatNetworkingService(apiKey: apiKey)
        case .release, .debug, .test, .preview:
            let choices = [
                SwiftyGPTChatResponseChoice(index: 0, message: SwiftyGPTChatAssistantMessage(content: "Hello, how can I assist you ?"), finishReason: .stop)
            ]
            let responseBody = SwiftyGPTChatResponseSuccessBody(id: UUID().uuidString, choices: choices, created: Date().timeIntervalSince1970, model: .gpt3_5_turbo, fingerprint: UUID().uuidString, object: .completion, usage: SwiftyGPTChatResponseTokenUsage(completion: 3, prompt: 3, total: 3))
            return SwiftyGPTChatMockService(responseBody: responseBody, duration: 0.3)
        }
    }
    
    private var apiKey: String {
        guard let apiKey = ProcessInfo.processInfo.environment["OPEN_AI_API_KEY"] else {
            fatalError("Missing OpenAI API key. Please set the OPEN_AI_API_KEY environment variable.")
        }
        return apiKey
    }
    
    private func sendMessage() {
        let sentMessage = SwiftyGPTChatUserMessage(content: typedMessage)
        messages.append(sentMessage)
        typedMessage = ""
        Task {
            do {
                let response = try await manager.send(messages: [sentMessage], model: .gpt3_5_turbo)
                switch response {
                case .success(let body):
                    if let receivedMessage = body.choices.first?.message {
                        messages.append(receivedMessage)
                    } else {
                        throw URLError(.badServerResponse)
                    }
                case .failure(let body):
                    throw body.error
                }
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ChatView(environment: .preview)
}
