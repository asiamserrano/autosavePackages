//
//  OptionalView.swift
//  autosave
//
//  Created by Asia Serrano on 5/11/25.
//

import SwiftUI

@available(iOS 13, *)
public struct OptionalView<E: Any, T: View>: View {
     
    public typealias Content = (E) -> T
    
    private let element: E?
    private let content: Content
    
    private init(element: E?, @ViewBuilder content: @escaping Content) {
        self.element = element
        self.content = content
    }
    
    public init(_ element: E?, @ViewBuilder content: @escaping Content) {
        self.init(element: element, content: content)
    }
    
//    public init(_ e: E?, @ViewBuilder content: @escaping Content) where E: Quantifiable {
//        self.init(element: e?.optional, content: content)
//    }

    public var body: some View {
        if let element {
            content(element)
        }
    }
    
}
