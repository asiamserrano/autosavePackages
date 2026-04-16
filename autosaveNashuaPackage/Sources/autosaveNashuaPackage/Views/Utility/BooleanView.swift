//
//  BooleanView.swift
//  autosave
//
//  Created by Asia Serrano on 7/3/25.
//

import SwiftUI

@available(iOS 13, *)
public struct BooleanView<T: View, C: View>: View {
        
    public typealias True = () -> T
    public typealias False = () -> C
    
    private let boolean: Bool
    private let trueContent: True
    private let falseContent: False
    
    public init(_ boolean: Bool, @ViewBuilder trueView: @escaping True, @ViewBuilder falseView: @escaping False) {
        self.boolean = boolean
        self.trueContent = trueView
        self.falseContent = falseView
    }

    public var body: some View {
        if self.boolean {
            self.trueContent()
        } else {
            self.falseContent()
        }
    }
    
}
