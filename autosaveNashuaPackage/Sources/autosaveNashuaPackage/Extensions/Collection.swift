//
//  Collection.swift
//  autosave
//
//  Created by Asia Serrano on 6/22/25.
//

import Foundation

extension Collection {
    
    public var isNotEmpty: Bool {
        self.count > 0
    }
    
    public var description: String {
        String(describing: self)
    }
        
}

//extension Collection where Element: Comparable {
//        
//    public func orderBy(state: OrderState) -> [Element] {
//        switch state {
//        case .sorted:
//            return self.sorted()
//        case .unsorted:
//            return self.map(\.self)
//        }
//    }
//    
////    private func orderBy(_ state: OrderState, action: (Element) -> Element) -> [Element] {
////        let mapped: [Element] = self.map(action)
////        return mapped.orderBy(state)
////    }
//        
//}

extension Collection where Element == String {
    
//    public func orderBy(state: OrderState) -> [Element] {
//        self.map(\.trimmed).orderBy(state: state)
////        self.orderBy(state, action: \.trimmed)
//    }
    
//    public var ordered: [Element] {
//        let wasSet: Bool = self is Set<Element>
//        let array = self.map(\.trimmed)
//        return wasSet ? array.sorted() : array
//    }
    
    public var data: Data {
        let wasSet: Bool = self is Set<Element>
        let array = self.map(\.trimmed)
        let strings = wasSet ? array.sorted() : array
        if let data = try? JSONEncoder().encode(strings) {
            return data
        } else {
            print("Failed to encode strings with JSON. Using delimiters instead.")
            let combined = strings.joined(separator: "\u{001F}")
            return Data(combined.utf8)
        }
    }
        
}

extension Collection where Element: Collection, Element.Element: Hashable {
        
    public var flatSet: Set<Element.Element> {
        Set(self.flatMap(\.self))
    }
    
}


//@available(iOS 13, *)
//extension Collection {
//    
//    public func flatMap<T: Collectable.E.Interface>(action: @escaping (Element) -> Collectable.Instance<T>) -> Collectable.Instance<T> {
//        .init(collection: self.flatMap(action))
//    }
//    
//}

//
//extension Collection where Element: Hashable, Element: Comparable {
//
//    public func subset(_ len: Int) -> [Self.Element] {
//        self.shuffled().prefix(len > self.count ? self.count : len).sorted()
//    }
//
//}
