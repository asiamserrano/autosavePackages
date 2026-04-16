//
//  AssetManager.swift
//  corePackage
//
//  Created by Asia Serrano on 4/9/26.
//

import Foundation
import SwiftUI


public enum AssetManager {
    
    private class CustomError: Error {
        
        private var message: String
        
        public init(_ message: String) {
            self.message = message
        }
        
        public var localizedDescription: String {
            self.message
        }
        
    }
    
    private enum Content {
        
        case string_array
        case image_data
        
        fileprivate init?<T>(_ t: T.Type) {
            switch t {
            case is Array<String>.Type:
                self = .string_array
            case is Data.Type:
                self = .image_data
            default:
                return nil
            }
        }
        
        fileprivate func load(_ asset: Assets) -> Any? {
            if let data = asset.data, let content = String(data: data, encoding: .utf8) {
                switch self {
                case .string_array:
                    let lines = content.components(separatedBy: CharacterSet.newlines)
                    return lines.filter(\.isNotEmpty)
                case .image_data:
                    return Data(base64Encoded: content.trimmed, options: [.ignoreUnknownCharacters])
                }
            }
            return nil
        }
        
    }
    
    public enum Assets: String {
        case image, names, strings
        
        fileprivate var data: Data? {
            NSDataAsset(name: self.rawValue)?.data
        }
        
    }
    
    public static func load<T>(_ asset: Assets) -> T? {
        do {
            if let content = Content(T.self) {
                if let t: T = content.load(asset) as? T {
                    return t
                } else {
                    throw CustomError("Failed to cast to type T")
                }
            } else {
                throw CustomError("Failed to create Content object")
            }
        } catch {
            print("Error in load for type T '\(T.self)' data from asset name '\(asset.rawValue)': \(error.localizedDescription)")
        }
        
        return nil
    }
    
    public static func load<T: Defaultable>(_ asset: Assets) -> T {
        load(asset) ?? .defaultValue
    }
    
}
