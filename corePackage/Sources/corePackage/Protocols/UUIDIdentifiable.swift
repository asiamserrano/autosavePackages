////
////  File 2.swift
////  autosavePackage
////
////  Created by Asia Serrano on 2/24/26.
////
//
//import Foundation
//
//@available(iOS 13, *)
//public protocol UUIDIdentifiable: Hashable, Identifiable where ID == UUID {
//    var id: UUID { get }
//}
//
//@available(iOS 17, *)
//extension UUIDIdentifiable {
//    
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.equals(rhs)
//    }
//        
////    public static func < (lhs: Self, rhs: Self) -> Bool {
////        lhs.id < rhs.id
////    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.id)
//    }
//
//    public func equals<T: UUIDIdentifiable>(_ t: T) -> Bool {
//        self.id == t.id
//    }
//    
//}
