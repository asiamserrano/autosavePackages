//
//  EditMode.swift
//  autosave
//
//  Created by Asia Serrano on 6/22/25.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
extension EditMode: Iterable {
    
    public static var cases: [Self] {
        [ .active, .inactive ]
    }
    
}
