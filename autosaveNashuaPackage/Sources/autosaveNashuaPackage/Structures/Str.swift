////
////  Str.swift
////  autosaveBeta
////
////  Created by Asia Serrano on 2/13/26.
////
//
//import Foundation
//
//@available(iOS 13, *)
//public struct Str: Identifiable {
//
//    public let id: String
//    public let rawValue: String
//    
//    public init(string: String) {
//        self.id = string.canonicalized
//        self.rawValue = string.trimmed
//    }
//    
//    public init<T: Enumerable>(enumerable: T) {
//        self.id = enumerable.id
//        self.rawValue = enumerable.rawValue
//    }
//    
//    public init(foo: Foo) {
//        self.id = foo.string.canonicalized
//        self.rawValue = foo.string.trimmed
//    }
//    
//    public protocol Foo {
//        var string: String { get }
//    }
//    
//}
//
//@available(iOS 13, *)
//extension Str: Defaultable {
//    
//    public static var defaultValue: Self {
//        .init(string: .defaultValue)
//    }
//    
//}
//
//@available(iOS 13, *)
//extension Str: Randomizable {
//    
//    public static var random: Self {
//        .init(string: .random)
//    }
//    
//}
