//
//  Icon.swift
//  AutoSaveMock
//
//  Created by Asia Serrano on 2/2/26.
//

import SwiftUI

@available(iOS 17, *)
public struct Icon: View {

    private var iconName: Enum
    private var iconColor: Color
    private var iconWidth: CGFloat
    private var iconHeight: CGFloat

    public init(_ n: Enum, _ w: CGFloat?, _ h: CGFloat?,  _ c: Color?) {
        self.iconName = n
        self.iconColor = c ?? .pink
        self.iconWidth = w ?? .defaultValue
        self.iconHeight = h ?? .defaultValue
    }

    public init(_ n: Enum) {
        self = .init(n, nil, nil, nil)
    }

    public init(_ n: Enum, _ c: Color) {
        self = .init(n, nil, nil, c)
    }

    public init(_ n: Enum, _ c: Color, _ h: CGFloat) {
        self = .init(n, h, h, c)
    }

    public init(_ n: Enum, _ w: CGFloat, _ h: CGFloat) {
        self = .init(n, w, h, nil)
    }

    public init(_ n: Enum, _ c: CGFloat) {
        self = .init(n, c, c, nil)
    }

    public var body: some View {
        Image(iconName)
            .resizable()
            .scaledToFit()
            .frame(width: iconWidth, height: iconHeight)
            .foregroundColor(iconColor)
    }

}

@available(iOS 17, *)
extension Icon {
    
    public enum Enum: Enumerable {
        case plus
        case trash
        case pencil
        case calendar
        case chevron_left
        case chevron_right
        case chevron_up
        case chevron_down
        case checkmark
        case xmark_circle_fill
        case plus_circle_fill
        case plus_circle
        case arrow_down_circle_fill
        case opticaldisc_fill
        case person_fill
        case person_2_fill
        case person_3_fill
        case line_3_horizontal
        case ellipsis_circle
        case list_clipboard
        case list_star
        case gamecontroller
        case photo_circle_fill
        case arrow_right
        
        public var rawValue: String {
            self.description.replacingOccurrences(of: "_", with: ".")
        }
        
    }
    
}
