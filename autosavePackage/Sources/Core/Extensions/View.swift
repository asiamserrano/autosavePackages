//
//  View.swift
//  autosave
//
//  Created by Asia Serrano on 5/8/25.
//

import Foundation
import SwiftUI

@available(iOS 17, *)
extension View {
                
//    @ViewBuilder
//    public func FormattedView(_ key: String?, _ value: String?) -> some View {
//        HStack {
//            HStack {
//                Text(key ?? .defaultValue)
//                    .foregroundColor(.gray)
//                Spacer()
//            }
//            .frame(width: 95)
//            Text(value ?? .defaultValue)
//                .multilineTextAlignment(.leading)
//                .foregroundColor(.black)
//        }
//    }
//    
//    @ViewBuilder
//    public func FormattedView(_ key: Constants, _ value: String) -> some View {
//        FormattedView(key.rawValue, value)
//    }
//    
//    @ViewBuilder
//    public func FormattedView(_ key: String, _ value: UUID) -> some View {
//        FormattedView(key, value.uuidString)
//    }
//    
//    @ViewBuilder
//    public func FormattedView(_ key: String, _ value: Int) -> some View {
//        FormattedView(key, value.description)
//    }
//    
    @ViewBuilder
    public func CustomText(_ constant: Constants) -> some View {
        Text(constant.rawValue)
    }
    
    @ViewBuilder
    public func CustomDatePicker(_ constant: Constants, _ binding: Binding<Date>) -> some View {
        DatePicker(constant.rawValue, selection: binding, displayedComponents: .date)
    }
    
//    @ViewBuilder
//    public func CustomButton(_ constant: Constants, _ action: @escaping () -> Void) -> some View {
//        Button(constant.rawValue, action: action)
//    }
    
//    @ViewBuilder
//    func CheckMarkView(_ str: StringBuilder, isVisible: Bool) -> some View {
//        CheckMarkView(str.trim, isVisible: isVisible)
//    }
//    
    @ViewBuilder
    func CheckMarkView(_ str: String, isVisible: Bool) -> some View {
        HStack(alignment: .center) {
            Text(str)
            Spacer()
            Icon(.checkmark)
                .show(isVisible)
        }
    }
    
    public func boolean_action(_ bool: Bool, TRUE: @escaping () -> Void, FALSE: @escaping () -> Void) -> Void {
        bool ? TRUE() : FALSE()
    }

}
