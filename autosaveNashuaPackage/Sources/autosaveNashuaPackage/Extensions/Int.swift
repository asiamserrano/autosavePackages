//
//  Int.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

extension Int {
        
    public var leadingZero: String {
        String(format: "%02d", self)
    }
    
    public var toUInt8: UInt8 {
        let int = abs(self)
        return toUInt8(int)
    }
    
}

public extension Int {
    
    static var one: Self { 1 }
    
    func forEach(action: @escaping () -> Void) -> Void {
        let _ = self.map(action: action)
    }
    
    func map<T: Any>(action: @escaping () -> T) -> [T] {
        self.range.map { _ in action() }
    }
    
    func map<T: Any>(action: @escaping (Self) -> T) -> [T] {
        self.range.map(action)
    }
    
}

private extension Int {
    
    var range: [Self] {
        Array(0..<self)
    }
    
    func toUInt8(_ int: Self) -> UInt8 {
        let uInt8Max = Int(UInt8.max)
        if int == uInt8Max {
            return UInt8.max
        } else {
            let mod = int % uInt8Max
            if mod > 0 {
                return UInt8(mod)
            } else {
                let div = int / uInt8Max
                return div > uInt8Max ? div.toUInt8 : UInt8(div)
            }
        }
    }
    
}

//@available(iOS 13, *)
//extension Int: Containable.Element.Key { }
