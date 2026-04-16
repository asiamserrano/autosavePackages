////
////  EnumerableRegistry.swift
////  autosavePackage
////
////  Created by Asia Serrano on 2/25/26.
////
//
//import Foundation
//
//@available(iOS 17, *)
//public protocol EnumerableRegistry: Enumerable where Identifier.Registry == Self {
//    associatedtype Identifier: EnumerableRegistryIdentifier
////    typealias AnyMember = any Enumerable
//    typealias Members = Cases
//    typealias Member = Members.Element
//    var identifier: Identifier { get }
////    var anyMember: AnyMember { get }
//}
//
//@available(iOS 17, *)
//extension EnumerableRegistry {
//    
//    public static var allCases: Cases {
//        Identifier.cases.flatMap(\.registryMembers)
//    }
//    
//    // MARK: use with @Model classes caused @MainActor errors to populate
////    public var rawValue: String {
////        self.anyMember.rawValue
////    }
//    
//}
//
//
//
////
////@available(iOS 17, *)
////public protocol EnumerableRegistry: Enumerable {
////    
////    associatedtype Member: EnumerableRegistryMember where Member.Registry == Self
////    
////    associatedtype M = any EnumerableRegistryMember
////    
//////    typealias M = any Member
////    
//////    typealias M =  Member where Member.Registry == Self
//////    
//////    typealias M = any Identifiable where ID == String
//////    typealias Member = any EnumerableRegistryMember where Registry == Self
////}
////
////@available(iOS 17, *)
////public protocol EnumerableRegistryMember: Enumerable {
////    associatedtype Registry: EnumerableRegistry
////    var registryCases: Registry.Cases { get }
////}
//
//
////@available(iOS 17, *)
////public protocol EnumerableRegistry: Enumerable {
////    typealias Member = any EnumerableRegistryMember
////    static var members: [Member] { get }
////}
////
////@available(iOS 17, *)
////public protocol EnumerableRegistryMember: Enumerable {
////    associatedtype Registry: EnumerableRegistry
////}
////
////@available(iOS 17, *)
////public extension EnumerableRegistry {
////    
////    static func asMembersOf<R: EnumerableRegistry, M: EnumerableRegistryMember>( _ array: [M], for _: R.Type ) -> [Member] where M.Registry == R {
////        array
////    }
////    
////}
////
////@available(iOS 17, *)
////public enum EnumEnum {
////    
////    public protocol RegistryType: Enumerable where MyRegistry.MyType == Self {
////        associatedtype MyRegistry: EnumEnum.Registry
////        var builders: MyRegistry.Cases { get }
////    }
////    
////    public protocol Registry: Enumerable where MyType.MyRegistry == Self {
////        associatedtype MyType: EnumEnum.RegistryType
////        typealias Member = any RegistryMember
////        var type: RegistryType { get }
////        var member: Member { get }
////    }
////    
////    public protocol RegistryMember: Enumerable where Self.MyType.MyRegistry == Self.MyRegistry {
////        associatedtype MyRegistry: EnumEnum.Registry
////        associatedtype MyType: EnumEnum.RegistryType
////    }
////    
////}
//
//
//
//
//
////
////
////@available(iOS 17, *)
////public protocol EnumerableRegistry2: Enumerable {
////    typealias Member = any EnumerableRegistryMember2
////}
////
////@available(iOS 17, *)
////extension EnumerableRegistry2 {
////    
////    
////    
////}
////
////
////@available(iOS 17, *)
////public protocol EnumerableRegistryMember2: Enumerable {
////    associatedtype Registry: EnumerableRegistry
////    var registryCases: Registry.Cases { get }
////}
////
////@available(iOS 17, *)
////enum RootKind: Enumerable, EnumerableRegistryMember2 {
//////    typealias Registry = MyRegistry
////    
//////    typealias Registry = MyRegistry
////    case json, xml, yaml
////    var id: String { rawValue }
////    static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }
////    
////    var registryCases: MyRegistry.Cases { [] }
////}
////
////
////@available(iOS 17, *)
////enum FormatKind<Registry>: String, Enumerable, EnumerableRegistryMember where Registry == MyRegistry {
//////    typealias Registry = MyRegistry
////    case json, xml, yaml
////    var id: String { rawValue }
////    static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }
////}
////
////@available(iOS 17, *)
////enum SystemKind<Registry>: String, Enumerable, EnumerableRegistryMember where Registry == MyRegistry  {
////    case linux, macOS, windows
////    var id: String { rawValue }
////    static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }
////}
////
////@available(iOS 17, *)
////enum MyRegistry: Enumerable, EnumerableRegistry {
////    
////    static var allCases: [MyRegistry] { [] }
////    
////    case root
////    case format(FormatKind<Self>)
////    case system(SystemKind<Self>)
////
////    static var members: [Member] {
////        let formats = asMembersOf(FormatKind.allCases, for: MyRegistry.self)
////        let systems = asMembersOf(SystemKind.allCases, for: MyRegistry.self)
////        return formats + systems
////    }
////
////    var id: String { rawValue }
////    static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }
////}
