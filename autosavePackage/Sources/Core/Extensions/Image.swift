//
//  Image.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation
import SwiftUI

@available(iOS 17, *)
extension Image {
    
    public init(_ ui: UIImage?) {
        if let ui = ui, ui.isNotEmpty {
            self.init(uiImage: ui)
        } else {
            self.init(.photo_circle_fill)
        }
    }
    
    public init(_ icon: Icon.Enum) {
        self.init(systemName: icon.rawValue)
    }
    
}
