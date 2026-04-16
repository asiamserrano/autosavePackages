//
//  Array.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

extension Array: Defaultable {
    
    public static var defaultValue: Self { .init() }
    
}

//extension Array: Quantifiable {
//    
//    public var quantity: Int { self.count }
//    
//}

extension Array {
    
    public init(_ elements: Element...) {
        self = elements
    }
    
    public var random: Element {
        if let element: Element = self.randomElement() {
            return element
        } else {
            fatalError("unable to get random element for empty array: \(self)")
        }
    }
    
    public func union(_ elements: Element...) -> Self {
        self.union(collection: elements.map(\.self))
    }
    
    public func union<T: Collection>(collection: T) -> Self where T.Element == Element {
        var new: Self = .init()
        new.append(contentsOf: collection)
        new.append(contentsOf: self)
        return new
    }
    
    public func withHead(_ element: Element) -> Self {
        var new: Self = self
        new.insert(element, at: 0)
        return new
    }
    
    public mutating func remove(_ action: @escaping (Element) -> Bool) -> Void {
        if let index = self.firstIndex(where: action) {
            self.remove(at: index)
        }
    }
    

//    public static func + (lhs: Self, rhs: Element) -> Self {
//        lhs + [rhs]
//    }
//    
//    public static func + (lhs: Element, rhs: Self) -> Self {
//        [lhs] + rhs
//    }
        
}


extension Array where Element: Equatable {
    
    public mutating func insert(_ element: Element) -> Void {
        if self.contains(element) {
            print("array contains \(element). skipping insert.")
        } else {
            self.append(element)
        }
    }
    
}
