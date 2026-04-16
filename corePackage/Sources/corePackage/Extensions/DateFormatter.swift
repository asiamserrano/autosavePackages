//
//  DateFormatter.swift
//  autosave
//
//  Created by Asia Serrano on 5/9/25.
//

import Foundation

extension DateFormatter {
    
    public static func create(_ dateString: String) -> Date {
        DateFormatter(formatString: DateEnum.compact.rawValue).date(from: dateString)!
    }
    
    public static func format(_ date: Date, _ form: DateEnum) -> String {
        DateFormatter(formatString: form.rawValue).string(from: date)
    }
    
    private convenience init(formatString: String) {
        self.init()
        self.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        self.dateFormat = formatString
    }
    
    public enum DateEnum: String {
        case dashed = "yyyy-MM-dd"
        case compact = "yyyyMMdd"
        case long = "MMMM d, y"
        case year = "yyyy"
        case timestamp = "yyyyMMdd-hhmmssa"
        case precise = "yyyyMMddHHmmssSSS"
    }
    
}
