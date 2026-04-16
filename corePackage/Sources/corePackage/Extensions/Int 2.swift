//
//  Int64.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

extension Int64 {

    public var uInt8: UInt8 {
        let uInt8Max = Int64(UInt8.max)
        if self == uInt8Max {
            return UInt8.max
        } else {
            let mod = self % uInt8Max
            if mod > 0 {
                return UInt8(mod)
            } else {
                let div = self / uInt8Max
                return div > uInt8Max ? div.uInt8 : UInt8(div)
            }
        }
    }
    
}
