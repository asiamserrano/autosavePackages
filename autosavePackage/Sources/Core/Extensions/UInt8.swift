//
//  UInt8.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/24/26.
//

import Foundation

extension UInt8 {
    
//    public init?(_ string: String) {
//        if let int = Int(string) {
//            self = int.uInt8
//        } else {
//            return nil
//        }
//    }
    
}

@available(iOS 15, *)
extension UInt8: Defaultable {
    
    public static var defaultValue: UInt8 { 48 }
    
}
