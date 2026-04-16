//
//  Previewer.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/19/26.
//

import SwiftUI

@available(iOS 16, *)
public struct Previewer<T: View>: View {
    
    public typealias Content = () -> T
    
    private let content: Content

    public init(@ViewBuilder _ content: @escaping Content) {
        self.content = content
    }
    
    public var body: some View {
        NavigationStack {
            Form {
                self.content()
            }
        }
    }
    
}
