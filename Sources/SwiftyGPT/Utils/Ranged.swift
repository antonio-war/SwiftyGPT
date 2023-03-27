//
//  Ranged.swift
//  
//
//  Created by Antonio Guerra on 28/03/23.
//

import Foundation

@propertyWrapper
struct Ranged<Value: Rangeable>: Codable {
    private var range: ClosedRange<Value>
    private var value: Value
    
    init(wrappedValue value: Value, _ range: ClosedRange<Value>) {
        self.value = value
        self.range = range
    }
    
    var wrappedValue: Value {
        get {
            return max(min(value, range.upperBound), range.lowerBound)
        }
        set {
            value = newValue
        }
    }
        
    enum CodingKeys: CodingKey {
        case range
        case value
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Ranged<Value>.CodingKeys> = try decoder.container(keyedBy: Ranged<Value>.CodingKeys.self)
        self.range = try container.decode(ClosedRange<Value>.self, forKey: Ranged<Value>.CodingKeys.range)
        self.value = try container.decode(Value.self, forKey: Ranged<Value>.CodingKeys.value)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
