//
//  Files.swift
//  autosavePackage
//
//  Created by Asia Serrano on 3/9/26.
//

import Foundation
import SwiftData

public enum Files {
    
    public enum Extensions: String {
        case txt, json, sqlite
    }
    
    private enum Names: String {
        case strings, names, namespaces, image
    }
    
    private enum Content {
        
        case string_array(Data?)
        case dictionary(Data?)
        case image_data(URL)
        
        init?<T>(_ t: T.Type, _ url: URL) {
            let data = try? Data(contentsOf: url)
            switch t {
            case is Array<String>.Type:
                self = .string_array(data)
            case is AnyDictionary.Type:
                self = .dictionary(data)
            case is Data.Type:
                self = .image_data(url)
            default:
                let type = String(reflecting: T.self)
                print("Type '\(t)' has not been implemented. Skipping load.")
                return nil
            }
        }
        
        public func load() -> Any? {
            switch self {
            case .string_array(let data):
                loadStrings(data)
            case .dictionary(let data):
                loadDictionary(data)
            case .image_data(let url):
                loadImageData(url)
            }
        }
       
        private func loadStrings(_ data: Data?) -> [String]? {
            print("loading file as strings")
            // 2. Load the data into a single String
            if let data = data, let fileContents = String(data: data, encoding: .utf8) {
                // 3. Split the string into an array of strings based on newlines
                // Using CharacterSet.newlines handles various newline characters correctly
                let lines = fileContents.components(separatedBy: CharacterSet.newlines)
                
                // Filter out any potential empty strings that might result from trailing newlines
                return lines.filter(\.isNotEmpty)
            } else {
                print("Unable to load data as string.")
            }
            return nil
        }

        private func loadDictionary(_ data: Data?) -> [AnyHashable: Any]? {
            print("loading file as dictionary")
            if let data = data {
                do {
                    // 2. Deserialize the JSON data into a Swift object (dictionary)
                    // JSONSerialization converts raw JSON data into a native Swift type.
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any] {
                        return jsonObject
                    } else {
                        print("Unable to load data as dictionary.")
                    }
                } catch {
                    // Handle potential errors like file not found or invalid JSON
                    print("Error reading or parsing JSON file: \(error.localizedDescription)")
                }
            }
            return nil
        }
        
        private func loadImageData(_ url: URL) -> Data? {
            do {
                if fileExsists(url.path) {
                    if let cleaned = try? String(contentsOf: url, encoding: .utf8).trimmed {
                        return Data(base64Encoded: cleaned, options: [.ignoreUnknownCharacters])
                    }
                }
            } catch {
                print("Error reading file: \(error.localizedDescription)")
            }
            return nil
        }

    }
    
    public static func load<T>(_ name: String, extension ext: Extensions) -> T? {
        let url: URL = createURL(name, extension: ext, directory: .resources)
        
        do {
            // 2. Load the file data
//            let data = try Data(contentsOf: url)
//            return Types(T.self)?.load(data) as? T
            return Content(T.self, url)?.load() as? T
        } catch {
            print("Unable to load '\(url)' with error: \(error)")
        }
        
        return nil
    }
    
    public static func load<T: Defaultable>(_ name: String, extension ext: Extensions) -> T {
        print("loading for defaultable")
        return load(name, extension: ext) ?? .defaultValue
    }
    
    private static func load<T>(_ name: Names, _ ext: Extensions) -> T? {
        load(name.rawValue, extension: ext)
    }
    
    private static func load<T: Defaultable>(_ name: Names, _ ext: Extensions) -> T {
        load(name.rawValue, extension: ext)
    }
    
}

public extension Files {
    
    static let STRINGS_TXT: [String] = load(.strings, .txt)
    static let NAMES_TXT: [String] = load(.names, .txt)
    static let NAMESPACES_JSON: [String: String] = load(.namespaces, .json)
    static let BOXART_IMAGE_DATA: Data? = load(.image, .txt)
    
//    static let DEFAULT_BOXART_IMAGE: Data? = {
//        let url = createURL("image", extension: .txt, directory: .resources)
//        let filePath = url.path
//        
//        do {
//            if fileExsists(filePath) {
//                print("Found image text file.")
//                if let cleaned = try? String(contentsOf: url, encoding: .utf8).trimmed {
//                    print("file contents created")
//                    
////                    let cleaned = fileContents
////                    let cleaned = fileContents
////                        .replacingOccurrences(of: "``` id=\"004wej\"", with: "")
////                        .replacingOccurrences(of: "```", with: "")
////                        .trimmingCharacters(in: .whitespacesAndNewlines)
//                    
//                    if let data = Data(base64Encoded: cleaned, options: [.ignoreUnknownCharacters]) {
//                        print("data was created")
//                        return data
//                    } else {
//                        print("data could not be created from cleaned contents:\n\(cleaned)")
//                    }
//                } else {
//                    print("file contents could not be created")
//                }
//            } else {
//                print("Cannot find image text file.")
//            }
//        } catch {
//            print("Error reading file: \(error.localizedDescription)")
//        }
//        
//        print("returning nil")
//        return nil
//    }()
    
    /*
     private enum Types {
         case string_array, dictionary
         
         public init?<T>(_ t: T.Type) {
             switch t {
             case is Array<String>.Type:
                 self = .string_array
             case is AnyDictionary.Type:
                 self = .dictionary
             default:
                 let type = String(reflecting: T.self)
                 print("Type '\(t)' has not been implemented. Skipping load.")
                 return nil
             }
         }
         
 //        public func data(_ url: URL) -> Data? {
 //            do {
 //                switch self {
 //                case .string_array, .dictionary:
 //                    return try Data(contentsOf: url)
 //                case .data:
 //                    if let cleaned = try? String(contentsOf: url, encoding: .utf8).trimmed,
 //                       let data = Data(base64Encoded: cleaned, options: [.ignoreUnknownCharacters]){
 //                        return data
 //                    }
 //                }
 //            } catch {
 //                print("Unable to load '\(url)' with error: \(error)")
 //                return nil
 //            }
 //        }
         
         public func load(_ data: Data) -> Any? {
             switch self {
             case .string_array:
                 loadStrings(data)
             case .dictionary:
                 loadDictionary(data)
             }
         }
         
         private func loadStrings(_ data: Data) -> [String]? {
             print("loading file as strings")
             // 2. Load the data into a single String
             if let fileContents = String(data: data, encoding: .utf8) {
                 // 3. Split the string into an array of strings based on newlines
                 // Using CharacterSet.newlines handles various newline characters correctly
                 let lines = fileContents.components(separatedBy: CharacterSet.newlines)
                 
                 // Filter out any potential empty strings that might result from trailing newlines
                 return lines.filter(\.isNotEmpty)
             } else {
                 print("Unable to load data as string.")
                 return nil
             }
         }

         private func loadDictionary(_ data: Data) -> [AnyHashable: Any]? {
             print("loading file as dictionary")
             do {
                 // 2. Deserialize the JSON data into a Swift object (dictionary)
                 // JSONSerialization converts raw JSON data into a native Swift type.
                 if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any] {
                     return jsonObject
                 } else {
                     print("Unable to load data as dictionary.")
                 }
             } catch {
                 // Handle potential errors like file not found or invalid JSON
                 print("Error reading or parsing JSON file: \(error.localizedDescription)")
             }
             return nil
         }
         
         
     }
     */
    
}

@available(iOS 17, *)
extension Files {
    
    public static func createPreviewStore(_ storeName: String) -> URL {
        let url: URL = createURL(storeName, extension: .sqlite, directory: .preview_stores)
        let filePath = url.path

        if fileExsists(filePath) {
            print("File at: '\(filePath)' already exists. Skipping creation.")
        } else {
            if createFile(filePath) {
                print("File created successfully at: \(filePath)")
            } else {
                print("Failed to create file at: \(filePath)")
            }
        }
        
        return url
    }
    
    public static func createPreviewStore<T: PersistentIdentifiable>(_ t: T.Type) -> URL {
        let storeName = Delimiters.empty.joined(T.relativeName, "PreviewStore")
        return createPreviewStore(storeName)
    }
    
}

public extension Files {
    
    @discardableResult
    static func fileExsists(_ filePath: String) -> Bool {
        if FILE_MANAGER.fileExists(atPath: filePath) {
            print("File at: '\(filePath)' exists")
            return true
        } else {
            print("File at: '\(filePath)' does not exist")
            return false
        }
    }
    
    @discardableResult
    static func createFile(_ filePath: String) -> Bool {
        if FILE_MANAGER.createFile(atPath: filePath, contents: nil) {
            print("File created successfully at: \(filePath)")
            return true
        } else {
            print("Failed to create file at: \(filePath)")
            return false
        }
    }
    
    static func deleteFile(_ filePath: String) -> Void {
        // It's a good practice to use the URL related API (removeItem(at:)),
        // rather than converting the URL to a path string.
        do {
            try FILE_MANAGER.removeItem(atPath: filePath)
            print("File deleted successfully at: \(filePath)")
        } catch {
            // Handle any errors that occur during the deletion process
            print("Error deleting file: \(error.localizedDescription)")
        }
    }
    
}

private extension Files {
    
    static let FILE_MANAGER: FileManager = .default
    
    static func createURL(_ name: String, extension ext: Extensions, directory: EnvironmentVariables.Directories) -> URL {
        let fileName = Delimiters.period.joined(name, ext.rawValue)
        let path = Delimiters.forward_slash.joined(directory.rawValue, fileName)
        return URL(fileURLWithPath: path)
    }
    
//    @discardableResult
//    static func fileExsists(_ filePath: String) -> Bool {
//        if FILE_MANAGER.fileExists(atPath: filePath) {
//            print("File at: '\(filePath)' exists")
//            return true
//        } else {
//            print("File at: '\(filePath)' does not exist")
//            return false
//        }
//    }
//    
//    @discardableResult
//    static func createFile(_ filePath: String) -> Bool {
//        if FILE_MANAGER.createFile(atPath: filePath, contents: nil) {
//            print("File created successfully at: \(filePath)")
//            return true
//        } else {
//            print("Failed to create file at: \(filePath)")
//            return false
//        }
//    }
//    
//    static func deleteFile(_ filePath: String) -> Void {
//        // It's a good practice to use the URL related API (removeItem(at:)),
//        // rather than converting the URL to a path string.
//        do {
//            try FILE_MANAGER.removeItem(atPath: filePath)
//            print("File deleted successfully at: \(filePath)")
//        } catch {
//            // Handle any errors that occur during the deletion process
//            print("Error deleting file: \(error.localizedDescription)")
//        }
//    }
    
}
