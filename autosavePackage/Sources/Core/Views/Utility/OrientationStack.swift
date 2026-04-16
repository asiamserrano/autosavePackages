//
//  OrientationStack.swift
//  autosave
//
//  Created by Asia Serrano on 6/15/25.
//

import SwiftUI

@available(iOS 13, *)
public struct OrientationStack<T: View>: View {
    
    public typealias Content = () -> T
    
    private let content: Content
    private let orientation: OrientationEnum
    
    public init(_ orientation: OrientationEnum, @ViewBuilder _ content: @escaping Content) {
        self.orientation = orientation
        self.content = content
    }
    
    public var body: some View {
        switch orientation {
        case .vstack:
            VStack(alignment: .leading, content: content)
        case .hstack:
            HStack(alignment: .center, content: content)
        }
    }
    
}

@available(iOS 13, *)
extension OrientationStack {
    
    public enum OrientationEnum {
        case vstack, hstack
    }
    
}
