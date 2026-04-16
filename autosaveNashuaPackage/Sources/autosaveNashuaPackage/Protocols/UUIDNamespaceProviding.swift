//
//  File 2.swift
//  autosavePackage
//
//  Created by Asia Serrano on 3/10/26.
//

import Foundation

@available(iOS 17, *)
public protocol UUIDNamespaceProviding {
    
    typealias UUIDNamespace = UUID.Namespace
    
    static var namespace: UUIDNamespace { get }
//    var uuid: UUID { get }
}

@available(iOS 17, *)
extension UUIDNamespaceProviding {
    
    public var namespace: UUID.Namespace { Self.namespace }
    public var nsString: String { self.namespace.namespaceString }
//    public var uuidString: String { self.uuid.uuidString }
    
}
