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
extension UUID {
    
    fileprivate typealias Binary = (
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8
    )
    
    fileprivate static let NAMESPACES: [String: Namespace] = .init(uniqueKeysWithValues: Files.NAMESPACES_JSON.map { element in
        return (element.key, .init(uuidString: element.value))
    })
    
//    public enum V3Data {
//        case string(String)
//        case strings(any Collection<String>)
//        case uiimage(UIImage)
//        
//        public var data: Data? {
//            switch self {
//            case .string(let string):
//                try? JSONEncoder().encode(string)
//            case .strings(let collection):
//                collection.data
//            case .uiimage(let uIImage):
//                uIImage.pngData
//            }
//        }
//    }
    
    public struct Namespace {
        
        public protocol Providing {
            static var namespaceKey: String { get }
//            associatedtype Contract
//            static var contract: Namespace { get }
//            static var namespace: Namespace { get }
        }
        
//        public init<T: Providing>(providing t: T.Type) {
////            let key = String(describing: T.Contract.self)
////            let uuidString = getUUIDString(withKey: key)
////            self.init(uuidString)
//            
//            self = .defaultValue
//        }
//        
//        public init<T: TypeMetadataProviding>(typeMetadata t: T.Type) {
//            let uuid: UUID = .init(namespace: t.contract, name: t.absoluteName.asArray)
//            self.init(uuid: uuid)
//        }
  
        public static let defaultValue = Namespace(uuidString: defaultValueUUIDString)
        
        fileprivate let tuple: Binary
        public let string: String
        
        private init(uuid: UUID) {
            self.tuple = uuid.uuid
            self.string = uuid.uuidString
        }
        
        fileprivate init(uuidString: String) {
            if let uuid: UUID = .init(uuidString: uuidString) {
                self.init(uuid: uuid)
            } else {
                let error = "Error casting uuidString '\(uuidString)' to UUID Namespace"
                print(error)
                fatalError(error)
            }
        }
        
//        public init(key: String) {
//            let uuidString = {
//                if let uuidString = Files.NAMESPACES_JSON[key] {
//                    return uuidString
//                } else {
//                    print("key '\(key)' not found. Using default UUIDString")
//                    return defaultValueUUIDString
//                }
//            }()
//            self.init(uuidString: uuidString)
//        }
        
        public func uuid(mask: UInt8, _ strings: String...) -> UUID {
            .init(namespace: self, name: strings, version: mask)
        }
        
//        public func uuid(mask: UInt8, _ v3Data: V3Data...) -> UUID {
//            let data = v3Data.compactMap { $0.data }
//            return .init(namespace: self, data: data, version: mask)
//        }
                        
    }

}

@available(iOS 17, *)
private extension UUID {
    
    static let defaultValueUUIDString = "00000000-0000-0000-0000-000000000000"
    
    init(namespace: Namespace, name: any Collection<String>, version: UInt8? = nil) {
        let data = [ name.data ]
        self.init(namespace: namespace, data: data, version: version)
//        // 1) Get namespace bytes in network byte order (big-endian)
//        var ns = namespace.tuple
//        var dataBytes = withUnsafeBytes(of: &ns) { Data($0) }
//        
//        // 2) Append name bytes
//        dataBytes.append(name.data)
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
    }
    
    init(namespace: Namespace, data: [Data], version: UInt8? = nil) {
        // 1) Get namespace bytes in network byte order (big-endian)
        var ns = namespace.tuple
        var dataBytes = withUnsafeBytes(of: &ns) { Data($0) }
        
        // 2) Append name bytes
        data.forEach { dataBytes.append($0) }
//        dataBytes.append(name.data)
        
        // 1) Hash the UTF-8 bytes of the string
        let digest = Insecure.MD5.hash(data: dataBytes)
        var bytes = Data(digest) // 16 bytes
        
        // 3) Use functional version/variant bits (RFC 4122)
        let version = version ?? .defaultValue
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
    
}

@available(iOS 17, *)
public extension UUID.Namespace.Providing {
    
    static var namespace: UUID.Namespace {
        let key = Self.namespaceKey
        if let ns = UUID.NAMESPACES[key] {
            return ns
        } else {
            print("key '\(key)' not found. Using default UUIDString")
            return .defaultValue
        }
    }
    
    var namespace: UUID.Namespace { Self.namespace }
    
}
