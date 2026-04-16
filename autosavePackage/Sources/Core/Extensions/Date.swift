//
//  Date.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

@available(iOS 15, *)
extension Date: Randomizable {
    
    public static var random: Self {
        let now = Date().timeIntervalSince1970
        let randomSeconds = TimeInterval.random(in: 0...now)
        return Date(timeIntervalSince1970: randomSeconds)
    }
    
}

@available(iOS 15, *)
public extension Date {

    static func fromString(compact: String) -> Self {
        return DateFormatter.create(compact)
    }
    
    static func fromDate(_ other: Self) -> Self {
        return .fromString(compact: other.compact)
    }
    
    static func fromDateComponents(_ year: Int, _ month: Int, _ day: Int) -> Self {
        let month_str: String = month.leadingZero
        let day_str: String = day.leadingZero
        let compact: String = "\(year)\(month_str)\(day_str)"
        return .fromString(compact: compact)
    }
    
    var long: String {
        DateFormatter.format(self, .long)
    }
    
    var dashed: String {
        DateFormatter.format(self, .dashed)
    }
    
    var compact: String {
        DateFormatter.format(self, .compact)
    }

    var precise: String {
        DateFormatter.format(self, .precise)
    }
    
    var toUInt8: UInt8 {
        if let int = Int(compact) {
            return int.toUInt8
        } else {
            print("Unabled to convert to compact string '\(compact)' to Int. Using UInt8 defaultValue.")
            return .defaultValue
        }
    }
    
}

@available(iOS 17, *)
extension Date {
    
    public func uuid(_ namespace: UUID.Namespace) -> UUID {
        namespace.uuid(mask: toUInt8, precise, sinceReference, since1970)
    }
        
    private var sinceReference: String {
        String(self.timeIntervalSinceReferenceDate)
    }
    
    private var since1970: String {
        String(self.timeIntervalSince1970)
    }

}
