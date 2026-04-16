//
//  UUID.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/17/26.
//

import Foundation
import SwiftData
import CryptoKit
import SwiftUI


@available(iOS 17, *)
extension UUID: Defaultable {
    
    public static var defaultValue: Self {
        let binary: Binary = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        return .init(uuid: binary)
    }
    
}

@available(iOS 17, *)
extension UUID {
    
    public struct Namespace {
        
        fileprivate let namespace: UUID
        
        public init<T: TypeMetadataProviding>(_ value: T.Type) {
            self.namespace = .init(namespace: .defaultValue, version: .defaultValue, names: value.absoluteName, value.relativeName)
        }
        
        public func uuid(_ names: String..., mask: UInt8? = nil) -> UUID {
            let version = mask ?? .defaultValue
            return .init(namespace: self.namespace, version: version, names: names)
        }
        
        public var namespaceString: String { self.namespace.uuidString }
        
    }
    
}

@available(iOS 17, *)
private extension UUID {
    
    typealias Binary = (
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8
    )
    
    init(namespace: UUID, version: UInt8, names: String...) {
        self.init(namespace: namespace, version: version, names: names)
    }
    
    init(namespace: UUID, version: UInt8, names: any Collection<String>) {
        self.init(namespace: namespace, version: version, data: names.data)
    }
    
    init(namespace: UUID, version: UInt8, data: Data...) {
        // 1) Get namespace bytes in network byte order (big-endian)
        var ns = namespace.uuid
        var dataBytes = withUnsafeBytes(of: &ns) { Data($0) }
        
        // 2) Append name bytes
        data.forEach { dataBytes.append($0) }
//        dataBytes.append(name.data)
        
        // 1) Hash the UTF-8 bytes of the string
        let digest = Insecure.MD5.hash(data: dataBytes)
        var bytes = Data(digest) // 16 bytes
        
        // 3) Use functional version/variant bits (RFC 4122)
        bytes[6] = (bytes[6] & 0x0F) | version  // version
        bytes[8] = (bytes[8] & 0x3F) | 0x80  // variant = 10xx xxxx
        
        // 4) Build UUID from the 16 bytes
        let uuid = bytes.withUnsafeBytes { rawPtr -> uuid_t in
            let p = rawPtr.bindMemory(to: UInt8.self).baseAddress!
            return (p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7],
                    p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15])
        }
        
        self.init(uuid: uuid)
    }
    
//    init(_ digest: Insecure.MD5.Digest, _ version: UInt8) {
//        // 1) Hash the UTF-8 bytes of the string
//        var bytes = Data(digest) // 16 bytes
//        
//        // 3) Use functional version/variant bits (RFC 4122)
//        let version = version ?? .defaultValue
//        bytes[6] = (bytes[6] & 0x0F) | version  // version
//        bytes[8] = (bytes[8] & 0x3F) | 0x80  // variant = 10xx xxxx
//        
//        // 4) Build UUID from the 16 bytes
//        let uuid = bytes.withUnsafeBytes { rawPtr -> uuid_t in
//            let p = rawPtr.bindMemory(to: UInt8.self).baseAddress!
//            return (p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7],
//                    p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15])
//        }
//        
//        self.init(uuid: uuid)
//    }
    
//    init(namespace: UUID, version: UInt8, _ dataFunc: (Data) -> Data) {
//        // 1) Get namespace bytes in network byte order (big-endian)
//        var ns = namespace.uuid
//        var dataBytes = dataFunc(withUnsafeBytes(of: &ns) { Data($0) })
//        
////        // 2) Append name bytes
////        data.forEach { dataBytes.append($0) }
//////        dataBytes.append(name.data)
//        
//        // 1) Hash the UTF-8 bytes of the string
//        let digest = Insecure.MD5.hash(data: dataBytes)
//        var bytes = Data(digest) // 16 bytes
//        
//        // 3) Use functional version/variant bits (RFC 4122)
//        let version = version ?? .defaultValue
//        bytes[6] = (bytes[6] & 0x0F) | version  // version
//        bytes[8] = (bytes[8] & 0x3F) | 0x80  // variant = 10xx xxxx
//        
//        // 4) Build UUID from the 16 bytes
//        let uuid = bytes.withUnsafeBytes { rawPtr -> uuid_t in
//            let p = rawPtr.bindMemory(to: UInt8.self).baseAddress!
//            return (p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7],
//                    p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15])
//        }
//        
//        self.init(uuid: uuid)
//    }
}
