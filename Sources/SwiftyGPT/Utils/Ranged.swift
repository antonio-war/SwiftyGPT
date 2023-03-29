//
//  Ranged.swift
//  
//
//  Created by Antonio Guerra on 28/03/23.
//

import Foundation

@propertyWrapper
struct Ranged<Value: Comparable & Numeric>: Equatable {
    private var range: ClosedRange<Value>
    private var value: Value?
    
    init(wrappedValue value: Value?, _ range: ClosedRange<Value>) {
        self.value = value
        self.range = range
    }
    
    var wrappedValue: Value? {
        get {
            if let value {
                return max(min(value, range.upperBound), range.lowerBound)
            } else {
                return nil
            }
        }
        set {
            value = newValue
        }
    }
    
    static func == (lhs: Ranged, rhs: Ranged) -> Bool {
        return lhs.wrappedValue == rhs.wrappedValue
    }
}
