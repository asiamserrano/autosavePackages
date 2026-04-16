////
////  HashIDProviding.swift
////  autosavePackage
////
////  Created by Asia Serrano on 3/4/26.
////
//
//import Foundation
//
//public protocol HashIDProviding {
//    associatedtype T
//    var strict: UUID { get } // sensitive to punctuation/case
//    var fuzzy: UUID { get } // tolerant canonicalization
//}
//
//extension HashIDProviding {
//    
//    public static var type: T.Type { T.self }
//    
//}
