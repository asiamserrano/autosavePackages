//
//  UUIDNamespace.swift
//  autosaveBeta
//
//  Created by Asia Serrano on 2/25/26.
//

//public struct UUIDNamespace {
//    
//    public protocol Providing {
//        associatedtype Contract
//        static var contract: Namespace { get }
//        static var namespace: Namespace { get }
//    }
//    
//    public init<T: Providing>(providing t: T.Type) {
//        let key = String(describing: T.Contract.self)
//        let uuidString = getUUIDString(withKey: key)
//        self.init(uuidString)
//    }
//    
//    public init<T: TypeMetadataProviding>(typeMetadata t: T.Type) {
//        let uuid: UUID = .init(namespace: t.contract, name: t.absoluteName.asArray)
//        self.init(uuid: uuid)
//    }
//
//    public static let defaultValue = Namespace(defaultValueUUIDString)
//    
//    fileprivate let tuple: UUIDTuple
//    public let string: String
//    
//    private init(uuid: UUID) {
//        self.tuple = uuid.uuid
//        self.string = uuid.uuidString
//    }
//    
//    private init(_ uuidString: String) {
//        if let uuid: UUID = .init(uuidString: uuidString) {
//            self.init(uuid: uuid)
//        } else {
//            let error = "Error casting uuidString '\(uuidString)' to UUID Namespace"
//            print(error)
//            fatalError(error)
//        }
//    }
//    
//    public func uuid(mask: UInt8, _ strings: String...) -> UUID {
//        .init(namespace: self, name: strings, version: mask)
//    }
//                    
//}
