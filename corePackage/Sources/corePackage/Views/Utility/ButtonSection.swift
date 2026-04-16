//
//  ButtonSection.swift
//  autosave
//
//  Created by Asia Serrano on 7/3/25.
//

import SwiftUI

@available(iOS 17, *)
public struct ButtonSection<T: View>: View {
    
    public typealias Action = () -> Void
    public typealias Content = () -> T
    
    private let content: Content
    private let action: Action
    private let text: String
    private let disabled: Bool
    
    public init(_ text: String, _ disabled: Bool = false, action: @escaping Action, @ViewBuilder content: @escaping Content) {
        self.content = content
        self.action = action
        self.text = text
        self.disabled = disabled
    }
    
    public var body: some View {
        Section(content: {
            self.content()
        }, header: {
            Button(action: self.action, label: {
                HStack(alignment: .center, spacing: 17) {
                    Icon(.plus_circle_fill, 22, 22, .green)
                    Text(self.text)
                }
                .padding(.leading, 1)
            })
            .padding(.bottom, 8)
            .disabled(self.disabled)
        })
        .textCase(nil)
    }
    
}
