////
////  ResourceFile.swift
////  autosavePackage
////
////  Created by Admin on 3/9/26.
////
//
//import Foundation
//
//public enum ResourceFile {
//    
//    public enum Extensions: String {
//        case txt, json
//    }
//    
//    private enum Names: String {
//        case strings, names, namespaces
//    }
//    
//    private enum Types {
//        case string_array, dictionary
//        
//        public init?<T>(_ t: T.Type) {
//            switch t {
//            case is Array<String>.Type:
//                self = .string_array
//            case is AnyDictionary.Type:
//                self = .dictionary
//            default:
//                let type = String(reflecting: T.self)
//                print("Type '\(t)' has not been implemented. Skipping load.")
//                return nil
//            }
//        }
//        
//        public func load(_ data: Data) -> Any? {
//            switch self {
//            case .string_array:
//                loadStrings(data)
//            case .dictionary:
//                loadDictionary(data)
//            }
//        }
//        
//        private func loadStrings(_ data: Data) -> [String]? {
//            print("loading file as strings")
//            // 2. Load the data into a single String
//            if let fileContents = String(data: data, encoding: .utf8) {
//                // 3. Split the string into an array of strings based on newlines
//                // Using CharacterSet.newlines handles various newline characters correctly
//                let lines = fileContents.components(separatedBy: CharacterSet.newlines)
//                
//                // Filter out any potential empty strings that might result from trailing newlines
//                return lines.filter(\.isNotEmpty)
//            } else {
//                print("Unable to load data as string.")
//                return nil
//            }
//        }
//
//        private func loadDictionary(_ data: Data) -> [AnyHashable: Any]? {
//            print("loading file as dictionary")
//            do {
//                // 2. Deserialize the JSON data into a Swift object (dictionary)
//                // JSONSerialization converts raw JSON data into a native Swift type.
//                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any] {
//                    return jsonObject
//                } else {
//                    print("Unable to load data as dictionary.")
//                }
//            } catch {
//                // Handle potential errors like file not found or invalid JSON
//                print("Error reading or parsing JSON file: \(error.localizedDescription)")
//            }
//            return nil
//        }
//        
//    }
//    
//    public static func load<T>(_ name: String, extension ext: Extensions) -> T? {
//        let fileName = Delimiters.period.joined(name, ext.rawValue)
//        let path = Delimiters.forward_slash.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
//        let url = URL(fileURLWithPath: path)
//        
//        do {
//            // 2. Load the file data
//            let data = try Data(contentsOf: url)
//            return Types(T.self)?.load(data) as? T
//        } catch {
//            print("Unable to load '\(url)' with error: \(error)")
//        }
//        
//        return nil
//    }
//    
//    public static func load<T: Defaultable>(_ name: String, extension ext: Extensions) -> T {
//        print("loading for defaultable")
//        return load(name, extension: ext) ?? .defaultValue
//    }
//    
//    private static func load<T>(_ name: Names, _ ext: Extensions) -> T? {
//        load(name.rawValue, extension: ext)
//    }
//    
//    private static func load<T: Defaultable>(_ name: Names, _ ext: Extensions) -> T {
//        load(name.rawValue, extension: ext)
//    }
//    
//}
//
//public extension ResourceFile {
//    
//    static let STRINGS_TXT: [String] = load(.strings, .txt)
//    static let NAMES_TXT: [String] = load(.names, .txt)
//    static let NAMESPACES_JSON: [String: String] = load(.namespaces, .json)
//    
//}
//
//
////@available(iOS 16, *)
////fileprivate extension URL {
////    
////    private static let FILE_MANAGER = FileManager.default
////    
////    public init?(_ name: String, _ ext: String) {
////        let fileName = Delimiters.period.joined(name, ext)
////        let path = Delimiters.forward_slash.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
////        let url = URL(fileURLWithPath: path)
////        
////        let filePath = url.path(percentEncoded: <#T##Bool#>)
////        
////    }
////    
////    
////}
//
//
////public enum FileLoader {
////        
////    public enum Extensions: String {
////        case txt, json
////    }
////    
////    public enum Files: String {
////        case strings, names
////    }
////    
////    private struct FilePath {
////        let file: Files
////        let ext: Extensions
////        
////        init(_ file: Files, _ ext: Extensions) {
////            self.file = file
////            self.ext = ext
////        }
////        
////        
////        var url: URL {
////            let fileName = Delimiters.period.joined(file.rawValue, ext.rawValue)
////            let path = Delimiters.forward_slash.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
////            return URL(fileURLWithPath: path)
////        }
////        
////    }
////    
//////    public static let LOADED_STRINGS: [String] = Self.load(<#T##fn: String##String#>, extension: <#T##Extensions#>)
////    
////    private static let fileNameDelimeter: Delimiters = .period
////    private static let pathDelimeter: Delimiters = .forward_slash
////    
////    public static func load<T>(_ fn: String, extension ext: Extensions) -> T? {
////        // 1. Create the URL for the resource from filepath
////        let fileName = fileNameDelimeter.joined(fn, ext.rawValue)
////        return load(fileName)
////    }
////    
////    public static func load<T: Defaultable>(_ fileName: String, extension ext: Extensions) -> T {
////        print("loading for defaultable")
////        return load(fileName, extension: ext) ?? .defaultValue
////    }
////    
////    private static func load<T>(_ fn: Files, extension ext: Extensions) -> T? {
////        // 1. Create the URL for the resource from filepath
////        let fileName = fileNameDelimeter.joined(fn.rawValue, ext.rawValue)
////        let path = pathDelimeter.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
////        let url = URL(fileURLWithPath: path)
////        print(url)
////        
////        do {
////            // 2. Load the file data
////            let data = try Data(contentsOf: url)
////            switch T.self {
////            case is Array<String>.Type:
////                if let strings = loadStrings(data) as? T {
////                    return strings
////                }
////            case is AnyDictionary.Type:
////                if let dict = loadDictionary(data), let dict = dict as? T {
////                    return dict
////                }
////            default:
////                let type = String(reflecting: T.self)
////                print("Type '\(type)' has not been implemented. Skipping load.")
////            }
////        } catch {
////            print("Unable to load '\(path)' with error: \(error)")
////        }
////        
////        return nil
////        
////        
////    }
////
////    private static func load<T>(_ fileName: String) -> T? {
////        // 1. Create the URL for the resource from filepath
////        let path = pathDelimeter.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
////        let url = URL(fileURLWithPath: path)
////        print(url)
////        
////        do {
////            // 2. Load the file data
////            let data = try Data(contentsOf: url)
////            switch T.self {
////            case is Array<String>.Type:
////                if let strings = loadStrings(data) as? T {
////                    return strings
////                }
////            case is AnyDictionary.Type:
////                if let dict = loadDictionary(data), let dict = dict as? T {
////                    return dict
////                }
////            default:
////                let type = String(reflecting: T.self)
////                print("Type '\(type)' has not been implemented. Skipping load.")
////            }
////        } catch {
////            print("Unable to load '\(path)' with error: \(error)")
////        }
////        
////        return nil
////    }
////
////    private static func load<T>(_ filePath: FilePath) -> T? {
////        let url = filePath.url
////        print(url)
////        
////        do {
////            // 2. Load the file data
////            let data = try Data(contentsOf: url)
////            switch T.self {
////            case is Array<String>.Type:
////                if let strings = loadStrings(data) as? T {
////                    return strings
////                }
////            case is AnyDictionary.Type:
////                if let dict = loadDictionary(data), let dict = dict as? T {
////                    return dict
////                }
////            default:
////                let type = String(reflecting: T.self)
////                print("Type '\(type)' has not been implemented. Skipping load.")
////            }
////        } catch {
////            print("Unable to load '\(url)' with error: \(error)")
////        }
////        
////        return nil
////    }
////
////    
////    public static func load<T: Defaultable>(_ files: Files, extension ext: Extensions) -> T {
////        print("loading for defaultable")
////        return load(files.rawValue, extension: ext) ?? .defaultValue
////    }
////
////    private static func loadStrings(_ data: Data) -> [String]? {
////        print("loading file as strings")
////        // 2. Load the data into a single String
////        if let fileContents = String(data: data, encoding: .utf8) {
////            // 3. Split the string into an array of strings based on newlines
////            // Using CharacterSet.newlines handles various newline characters correctly
////            let lines = fileContents.components(separatedBy: CharacterSet.newlines)
////            
////            // Filter out any potential empty strings that might result from trailing newlines
////            return lines.filter(\.isNotEmpty)
////        } else {
////            print("Unable to load data as string.")
////            return nil
////        }
////    }
////
////    private static func loadDictionary(_ data: Data) -> [AnyHashable: Any]? {
////        print("loading file as dictionary")
////        do {
////            // 2. Deserialize the JSON data into a Swift object (dictionary)
////            // JSONSerialization converts raw JSON data into a native Swift type.
////            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any] {
////                return jsonObject
////            } else {
////                print("Unable to load data as dictionary.")
////            }
////        } catch {
////            // Handle potential errors like file not found or invalid JSON
////            print("Error reading or parsing JSON file: \(error.localizedDescription)")
////        }
////        return nil
////    }
////    
////}
//
//
///*
// public static func load<T>(_ fn: String, extension ext: Extensions) -> T? {
//     // 1. Create the URL for the resource from filepath
//     let fileName = fileNameDelimeter.joined(fn, ext.rawValue)
//     let path = pathDelimeter.joined(EnvironmentVariables.RESOURCES_PATH, fileName)
//     let url = URL(fileURLWithPath: path)
//     
////        do {
////            // 2. Load the file contents into a single String
////            let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
////
////            // 3. Split the string into an array of strings based on newlines
////            // Using CharacterSet.newlines handles various newline characters correctly
////            let lines = fileContents.components(separatedBy: CharacterSet.newlines)
////
////            // Filter out any potential empty strings that might result from trailing newlines
////            return lines.filter(\.isNotEmpty)
////        } catch {
////            print("Unable to load url '\(fileURL)' with error: \(error)")
////            return nil
////        }
////
////        if T.self is [String] {
////            print("loading file as strings")
////        } else if T.self is [AnyHashable: Any] {
////            print("loading file as dictionary")
////        } else {
////            print("Type '\(String.init(describing: T.self))' has not been implemented. Skipping load.")
////        }
////
////
//     if let list = loadFileAsStrings(url) as? T {
//         return list
//     } else if let dict: [AnyHashable: Any] = loadJsonFileAsDictionary(url), let dict = dict as? T {
//         return dict
//     } else {
//         return nil
//     }
// }
// 
// public static func load<T: Defaultable>(_ fileName: String, extension ext: Extensions) -> T {
//     load(fileName, extension: ext) ?? .defaultValue
// }
//
// private static func loadFileAsStrings(_ fileURL: URL) -> [String]? {
//     do {
//         // 2. Load the file contents into a single String
//         let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
//         
//         // 3. Split the string into an array of strings based on newlines
//         // Using CharacterSet.newlines handles various newline characters correctly
//         let lines = fileContents.components(separatedBy: CharacterSet.newlines)
//         
//         // Filter out any potential empty strings that might result from trailing newlines
//         return lines.filter(\.isNotEmpty)
//     } catch {
//         print("Unable to load url '\(fileURL)' with error: \(error)")
//         return nil
//     }
// }
//
// private static func loadJsonFileAsDictionary(_ url: URL) -> [AnyHashable: Any]? {
//     do {
//         // 2. Load the file data
//         let data = try Data(contentsOf: url)
//
//         // 3. Deserialize the JSON data into a Swift object (dictionary)
//         // JSONSerialization converts raw JSON data into a native Swift type.
//         if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any] {
//             return jsonObject
//         } else {
//             print("Error: JSON is not a dictionary or could not be cast")
//             return nil
//         }
//     } catch {
//         // Handle potential errors like file not found or invalid JSON
//         print("Error reading or parsing JSON file: \(error.localizedDescription)")
//         return nil
//     }
// }
// */
