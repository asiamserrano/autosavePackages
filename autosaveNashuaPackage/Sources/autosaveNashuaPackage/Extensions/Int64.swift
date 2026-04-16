//
//  Int64.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

extension Int64 {
    
    public var toInt: Int {
        let int64 = abs(self)
        return toInt(int64)
    }
    
}

private extension Int64 {
    
    func toInt(_ int64: Self) -> Int {
        let intMax = Int64(Int.max)
        if int64 == intMax {
            return Int.max
        } else {
            let mod = int64 % intMax
            if mod > 0 {
                return Int(mod)
            } else {
                let div = int64 / intMax
                return div > intMax ? toInt(div) : Int(div)
            }
        }
    }
    
}
