//
//  Dictionary.swift
//  autosavePackage
//
//  Created by Asia Serrano on 2/10/26.
//


extension Dictionary: Defaultable {
    
    public static var defaultValue: Self { .init() }
    
}


extension Dictionary where Key: Comparable {
    
    public func sorted() -> [Self.Element] {
        self.sorted(by: { $0.key < $1.key })
    }
    
}

extension Dictionary: AnyDictionary {}

//@available(iOS 13, *)
//extension Dictionary where Key: Containable.Element.Key, Value: Containable.Element.Value {
//    
//    public typealias Container = Containable.Instance<Key, Value>
//    
//    public func containerize() -> Container {
//        .init(storage: self)
//    }
//    
//}
