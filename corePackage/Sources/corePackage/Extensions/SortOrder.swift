//
//  SortOrder.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

@available(iOS 17, *)
extension SortOrder: Iterable {
        
    public static var cases: [Self] {
        [ .forward, .reverse ]
    }
    
    public var icon: Icon.Enum {
        switch self {
        case .forward:
            return .chevron_up
        case .reverse:
            return .chevron_down
        }
    }
 
}
