//
//  CustomTextField.swift
//  autosave
//
//  Created by Asia Serrano on 5/8/25.
//

import SwiftUI

@available(iOS 17, *)
struct CustomTextField: View {
    
    @Binding private var binding: String
    
    private let keyboard: UIKeyboardType
    private let prompt: String
    
    public init(_ binding: Binding<String>, _ prompt: String = .defaultValue, keyboard: UIKeyboardType = .alphabet) {
        self._binding = binding
        self.keyboard = keyboard
        self.prompt = prompt
    }
    
    public init(_ constant: Constants, _ binding: Binding<String>) {
        self._binding = binding
        self.keyboard = .alphabet
        self.prompt = constant.rawValue
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 5) {
            
            TextField(String.defaultValue, text: $binding, prompt: Text(prompt), axis: .vertical)
                .keyboardType(keyboard)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
            
            if !self.binding.isEmpty {
                Button(action: {
                    self.binding = .init()
                }, label: {
                    Icon(.xmark_circle_fill)
                })
                .buttonStyle(.plain)
            }
            
        }
    }
    
}
