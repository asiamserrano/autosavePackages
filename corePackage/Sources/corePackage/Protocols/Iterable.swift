//
//  Iterable.swift
//  AutoSaveMock
//
//  Created by Asia Serrano on 2/6/26.
//

import Foundation

public protocol Iterable: Defaultable, Randomizable {
    
    typealias Cases = [Self]
    
    static var cases: Cases { get }
    
}

extension Iterable {
    
    public static var random: Self {
        Self.cases.randomElement()!
    }
    
    public static var defaultValue: Self {
        Self.cases.first!
    }
    
}

extension Iterable where Self: CaseIterable {
    
    public static var cases: Cases { Self.allCases.map(\.self) }
    
}
