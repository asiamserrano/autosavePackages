//
//  WrapperView.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 8/7/25.
//

import SwiftUI

@available(iOS 13, *)
public struct WrapperView<Element: Any, T: View>: View {
 
    public typealias Content = (Element) -> T
    
    private let element: Element
    private let content: Content
    
    public init(_ element: Element, @ViewBuilder content: @escaping Content) {
        self.element = element
        self.content = content
    }

    public var body: some View {
        OptionalView(element, content: content)
    }
    
}
