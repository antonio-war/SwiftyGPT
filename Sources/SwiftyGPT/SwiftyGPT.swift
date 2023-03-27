public struct SwiftyGPT {
    let apiKey: String
    let model: SwiftyGPTModel
    
    init(apiKey: String, model: SwiftyGPTModel = SwiftyGPTModel.stable) {
        self.apiKey = apiKey
        self.model = model
    }
}
