////
////  Identifiable.swift
////  autosavePackage
////
////  Created by Asia Serrano on 2/24/26.
////
//
//import Foundation
//
//@available(iOS 17, *)
//extension Identifiable where ID == UUID {
//    
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.id == rhs.id
//    }
//        
//    public static func < (lhs: Self, rhs: Self) -> Bool {
//        lhs.id < rhs.id
//    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.id)
//    }
//
//    public func equals<T: Identifiable>(_ t: T) -> Bool where T.ID == UUID {
//        self.id == t.id
//    }
//    
//    public var foo: String { self.id.uuidString }
//    
//}
