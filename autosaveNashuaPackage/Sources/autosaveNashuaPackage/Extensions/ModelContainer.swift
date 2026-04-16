////
////  ModelContainer.swift
////  autosavePackage
////
////  Created by Asia Serrano on 3/6/26.
////
//
//import Foundation
//import SwiftData
//
//@available(iOS 17, *)
//extension ModelContainer {
//        
//    public typealias PersistentTypes = [any PersistentModel.Type]
//    
//    public convenience init(memory: Bool, types: PersistentTypes) {
//        do {
//            let schema: Schema = .init(types)
//            let config: ModelConfiguration = .init(schema: schema, isStoredInMemoryOnly: memory)
//            try self.init(for: schema, configurations: [config])
//        } catch {
//            let message = "Could not create ModelContainer: \(error)"
//            print(message)
//            fatalError(message)
//        }
//    }
//    
//}

/*
 //    public static var preview: ModelContainer {
 //        let container: ModelContainer = .init(memory: true, types: [
 ////            Record.self, Foo.self, SuperClass.self, MyClass.self,
 ////            Person.self, Staff.self, Teacher.self, BusDriver.self, Student.self
 //        ])
 //
 //        container.mainContext.autosaveEnabled = false
 //        container.mainContext.undoManager = .init()
 //
 //        return container
 //    }
     
 */
