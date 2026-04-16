//
//  EnvironmentVariables.swift
//  autosavePackage
//
//  Created by Asia Serrano on 3/6/26.
//

import Foundation

public enum EnvironmentVariables {
    
    public static let APP_DIRECTORY = "DIR"
    public static let APP_NAME = "NAME"
    
    public static let RESOURCES_DIRECTORY = "\(APP_DIRECTORY)/Resources"
    public static let PREVIEW_STORES_DIRECTORY = "\(APP_DIRECTORY)/PreviewStores"
    
    public enum Directories: String {
        case app, resources, preview_stores
        
        public var rawValue: String {
            switch self {
            case .app:
                APP_DIRECTORY
            case .resources:
                RESOURCES_DIRECTORY
            case .preview_stores:
                PREVIEW_STORES_DIRECTORY
            }
        }
    }
        
}
