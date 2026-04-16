//
//  Defaultable.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/9/26.
//

/// Defaultable
///
/// Conformance to `Defaultable` means the type can provide a deterministic,
/// side-effect–free default value via `static var defaultValue`.
///
/// Notes:
/// - The returned value should be stable (the same every time), not dependent on runtime state
///   like the current time or randomness.
/// - For scalar/value types, this is typically a sentinel (e.g., `0`, `false`, `""`).
/// - For collections, this is typically the empty instance (e.g., `[]`, `[:]`, `[] as Set`).
/// - Types that require a fresh runtime value (e.g., `UUID()`, `Date.now`) should not conform
///   to `Defaultable`; consider a separate protocol (e.g., `Creatable.make()` or `Newable.new()`) for that use case.
///
///
public protocol Defaultable {
    static var defaultValue: Self { get }
}

