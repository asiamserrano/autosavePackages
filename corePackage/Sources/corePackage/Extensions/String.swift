//
//  String.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

//@available(iOS 13, *)
//extension String: Containable.Element.Member { }
//
//@available(iOS 13, *)
//extension String {
//    public typealias Container = Containable.Instance<String, String>
//}

@available(iOS 13, *)
public extension String {
    
//    static func joined(by separator: Separator, sort: Bool = false, _ strings: Self...) -> Self {
//        .joined(by: separator, sort: sort, strings)
//    }
//    
//    static func joined(by separator: Separator, sort: Bool = false, _ collection: Collection<Self>) -> Self {
//        let col = sort ? collection.sorted() : collection
//        return col.joined(separator: separator.rawValue)
//    }
    
//    var str: Str {
//        .init(string: self)
//    }
    
    var data: Data {
        return Data(self.trimmed.utf8)
    }
    
}

extension String {
    
    public func pluralize() -> Self {
        if let last: Character = self.trimmed.last, last != "s" {
            return "\(self)s"
        } else { return self }
    }
    
    public var canonicalized: Self {
        self.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined()
            .lowercased()
    }
    
    public var fuzzy: String { self.canonicalized }
    
    public var trimmed: Self {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var strict: String { self.trimmed }
    
    public var asArray: [Self] { [self] }
    
    public func replacingOccurrences(_ string: Self) -> Self {
        self.replacingOccurrences(of: string, with: Self.defaultValue)
    }
    
    public var isNotEmpty: Bool {
        self.count > 0
    }
    
}

extension String: Defaultable {
    
    public static var defaultValue: Self { .init() }
   
}

//extension String: Quantifiable {
//    
//    public var quantity: Int { self.trimmed.count }
//   
//}

extension String: Randomizable {

    private static func random(_ array: [Self]) -> Self {
        if array.isNotEmpty {
            let index = Int.random(in: 0..<array.count)
            return array[index]
        } else {
            let message = "Content not loaded. String array is empty."
            print(message)
            return "null"
//            fatalError(message)
        }
    }
    
    public static var random: Self {
        .random(AssetManager.load(.strings))
    }
    
    public static var randomName: Self {
        .random(AssetManager.load(.names))
    }
    
    public static func random(_ count: Int) -> Self {
        var set: Set<String> = .init()
        while set.count < count { set.insert(.random) }
        return set.joined(separator: " ")
    }
    
}
