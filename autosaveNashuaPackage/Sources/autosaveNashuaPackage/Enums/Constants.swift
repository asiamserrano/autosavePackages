//
//  Constants.swift
//  autosave
//
//  Created by Asia Serrano on 5/8/25.
//

import Foundation

@available(iOS 17, *)
public enum Constants: Enumerable {
    
    case title
    case release_date
    case back
    case cancel
    case confirm
    case ok
    case done
    case delete
    case edit
    case add
    case game
    case property
    case platform
    case games
    case properties
    case platforms
    
    public var rawValue: String {
        self.description.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
}
