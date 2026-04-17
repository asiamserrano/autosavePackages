//
//  Tridentifiable.swift
//  autosaveNashuaPackage
//
//  Created by Admin on 4/16/26.
//

import Foundation

@available(iOS 17, *)
public protocol Tridentifiable: TypeMetadataProviding {
    var constantID: UUID { get } // unchanging id
    var compositeID: UUID { get } // if there are any changes to any of the relevant content
    var trackingID: UUID { get } // if the unique composite key for the object has changed
}

@available(iOS 17, *)
public protocol PersistentIdentifiable: Tridentifiable, ObservableObject {}

@available(iOS 17, *)
public protocol PersistentSnapshot: Tridentifiable, ObservableObject {
    associatedtype Model: PersistentIdentifiable
}
