//
//  ClearableTextField.swift
//  cancun
//
//  Created by Asia Serrano on 7/6/24.
//

import SwiftUI


@available(iOS 17, *)
public struct ClearableTextField: View {
    
    @Binding
    private var binding: String
    
    private let keyboard: UIKeyboardType
    
    public init(_ binding: Binding<String>, keyboard: UIKeyboardType = .alphabet) {
        self._binding = binding
        self.keyboard = keyboard
    }
    
    private var text: String {
        self.binding
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 5) {
            
            TextField(text, text: $binding, axis: .vertical)
                .keyboardType(keyboard)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
            
            OptionalView(self.text, content: { txt in
                Button(action: {
                    self.binding = .init()
                }, label: {
                    Icon(.xmark_circle_fill)
                })
                .buttonStyle(.plain)
            })
            
        }
    }
}
