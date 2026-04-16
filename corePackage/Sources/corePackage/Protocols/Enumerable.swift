//
//  Enumerable.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/10/26.
//

import Foundation

/// Enumerable is a “rich enum” contract used across the package.
///
/// Identity and semantics:
/// - id: Fully-qualified, stable identity string (e.g., module/type/case). Used for equality and hashing.
/// - rawValue: Cross-type translation key. init?(rawValue:) is strict (exact match).
/// - description: Human-friendly presentation; may differ from rawValue.
///
/// Translation behavior:
/// - init?(rawValue:) performs strict translation using rawValue.
/// - init?(id:) may use fuzzy matching (contains-based) to support wrapper enums whose ids embed other ids.
/// - init?<T: Enumerable>(_:) prefers rawValue translation and falls back to id-based fuzzy matching.
@available(iOS 17, *)
public protocol Enumerable: Iterable, Identifiable, Hashable, CaseIterable, TypeMetadataProviding, RawRepresentable where RawValue == String {
    var id: String { get }
    var description: String { get }
    var rawValue: String { get }
}

@available(iOS 17, *)
extension Enumerable {
    
//    public static var namespaceKey: String { "Enumerable" }
    
    /// Finds a case by exact rawValue or by fuzzy id containment.
    /// - Note: This supports wrapper ↔ standard interop by allowing ids that embed another id.
    private static func find(_ string: String) -> Self? {
        Self.allCases.first(where: {
            $0.rawValue == string || $0.id.contains(string) || string.contains($0.id)
        })
    }
    
    /// Creates a case from a strict rawValue match.
    /// - Parameter rawValue: Exact raw value to match.
    /// - Returns: The matching case if one exists; otherwise nil.
    public init?(rawValue: RawValue) {
        if let enumerable = Self.find(rawValue) {
            self = enumerable
        } else {
            return nil
        }
    }

    /// Creates a case by id, allowing fuzzy matching (contains-based) for wrapper ids.
    /// - Parameter id: Identity string to match; may be a fully-qualified or embedded id.
    /// - Returns: The first matching case if found; otherwise nil.
    public init?(id: String) {
        if let enumerable = Self.find(id) {
            self = enumerable
        } else {
            return nil
        }
    }
    
    /// Creates a case by translating from another Enumerable instance.
    /// Translation policy:
    /// 1. Try strict translation using the other.rawValue (exact equality).
    /// 2. If that fails, try fuzzy id matching (contains-based) to support wrapper/embedded ids.
    ///
    /// - Parameter t: Another Enumerable value to translate from.
    /// - Returns: A matching case if rawValue matches exactly or if id containment succeeds; otherwise nil.
    public init?<T: Enumerable>(_ t: T) {
        if let found = Self.init(rawValue: t.rawValue) ?? Self.init(id: t.id) {
            self = found
        } else {
            return nil
        }
    }
    
}

@available(iOS 17, *)
extension Enumerable {
    
    public var id: String {
        String(reflecting: self)
    }
    
    public var rawValue: String {
        self.description.capitalized
    }
    
    public var description: String {
        String(describing: self)
    }
    
}

@available(iOS 17, *)
extension Enumerable {
    
    /// Equality is based on the stable id.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    /// Hashing is based on the stable id to align with equality.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public var index: Int {
        Self.cases.firstIndex(where: { $0.id == self.id }) ?? -1
    }
    
    public var next: Self {
        let i: Int = self.index + 1
        return Self.cases[i == Self.cases.count ? 0 : i]
    }
    
    public var uuid: UUID {
        self.namespace.uuid(self.id, self.description, self.rawValue, mask: self.index.toUInt8)
    }
    
}
