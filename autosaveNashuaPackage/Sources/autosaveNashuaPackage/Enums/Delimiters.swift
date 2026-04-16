//
//  Delimiters.swift
//  autosavePackage
//
//  Created by Admin on 3/9/26.
//

import Foundation

public enum Delimiters: String {
    
    case period = "."
    case comma = ","
    case space = " "
    case newLine = "\n"
    case comma_space = ", "
    case forward_slash = "/"
    case empty = ""
    
    public func joined(_ strings: String...) -> String {
        strings.joined(separator: self.rawValue)
    }
    
}
