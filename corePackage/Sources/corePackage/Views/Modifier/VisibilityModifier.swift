//
//  VisibilityModifier.swift
//  autosave
//
//  Created by Asia Serrano on 8/9/25.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
struct VisibilityModifier: ViewModifier {
    
    var isShowing: Bool

    func body(content: Content) -> some View {
        if isShowing {
            content
        }
    }
    
}

@available(iOS 13, *)
extension View {
    
    public func show(_ bool: Bool) -> some View {
        self.modifier(VisibilityModifier(isShowing: bool))
    }
    
    public func hide(_ bool: Bool) -> some View {
        self.modifier(VisibilityModifier(isShowing: !bool))
    }
    
}
