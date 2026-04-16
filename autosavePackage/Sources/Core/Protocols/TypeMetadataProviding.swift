//
//  SelfTypeProviding.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/26/26.
//

import Foundation

@available(iOS 17, *)
public protocol TypeMetadataProviding: UUID.Namespace.Providing {
    typealias Namespace = UUID.Namespace
}

@available(iOS 17, *)
extension TypeMetadataProviding {
    
    public static var namespaceKey: String { Self.relativeName }
    
    public static var absoluteName: String {
        String(reflecting: Self.self)
    }
    
    public static var relativeName: String {
        String(describing: Self.self)
    }
    
    public static var selfType: Self.Type {
        Self.self
    }
    
    public var absoluteName: String { Self.absoluteName }
    public var relativeName: String { Self.relativeName }
    public var selfType: Self.Type { Self.selfType }
    
}
