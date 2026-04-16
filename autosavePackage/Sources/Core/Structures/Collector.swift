////
////  Collector.swift
////  autosavePackage
////
////  Created by Asia Serrano on 2/10/26.
////
//
//import Foundation
//
//@available(iOS 13, *)
//public struct Collector<Element>: Collectable.Interface where Element: ProtocolKit.Hash.Compare.Interface {
//    
//    public var elements: Elements
//    
//    public init(elements: Elements) {
//        self.elements = elements
//    }
//    
//    @discardableResult
//    public mutating func add(_ element: Element) -> Bool {
//        self.elements.insert(element).inserted
//    }
//    
//    @discardableResult
//    public mutating func delete(_ element: Element) -> Element? {
//        self.elements.remove(element)
//    }
//    
//}
