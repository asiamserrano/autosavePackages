//
//  Data.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation

@available(iOS 15, *)
extension Data {
    
    public var toUInt8: UInt8 {
        var value: Int64 = 0
        let size = MemoryLayout<Int64>.size
        guard self.count >= size else { return .defaultValue }
        
        // This version is less prone to "ambiguous type" errors
        _ = Swift.withUnsafeMutableBytes(of: &value) { mutablePointer in
            self.copyBytes(to: mutablePointer, count: size)
        }
        
        return Int64(bigEndian: value).toInt.toUInt8
    }
    
    
//    private var toInt: Int {
//        var value: Int64 = 0
//        let size = MemoryLayout<Int64>.size
//        guard self.count >= size else { return 0 }
//        
//        // This version is less prone to "ambiguous type" errors
//        _ = Swift.withUnsafeMutableBytes(of: &value) { mutablePointer in
//            self.copyBytes(to: mutablePointer, count: size)
//        }
//        
//        return Int(truncatingIfNeeded: Int64(bigEndian: value))
//    }
//    
//    public var toUInt8: UInt8 {
//        self.toInt.toUInt8
////        var value: Int64 = 0
////        let size = MemoryLayout<Int64>.size
////        guard self.count >= size else { return 0 }
////        
////        // This version is less prone to "ambiguous type" errors
////        _ = Swift.withUnsafeMutableBytes(of: &value) { mutablePointer in
////            self.copyBytes(to: mutablePointer, count: size)
////        }
////        
////        return Int64(bigEndian: value).toInt.toUInt8
//    }
    
//    public var toInt: Int {
//         var value: Int64 = 0
//         let size = MemoryLayout<Int64>.size
//         guard self.count >= size else { return 0 }
//         
//         // This version is less prone to "ambiguous type" errors
//         _ = Swift.withUnsafeMutableBytes(of: &value) { mutablePointer in
//             self.copyBytes(to: mutablePointer, count: size)
//         }
//         
//         return Int(truncatingIfNeeded: Int64(bigEndian: value))
//     }
    
//    public var mask: UInt8 {
//        let size = MemoryLayout<Int64>.size
//        guard self.count >= size else { return 0 }
//        
//        var value: Int64 = 0
//        self.withUnsafeBytes { (pointer: UnsafeRawBufferPointer) in
//                   // Use baseAddress to copy the memory safely
//                   if let baseAddress = pointer.baseAddress {
//                       let _ = withUnsafeMutableBytes(of: &value) { mutablePointer in
//                           mutablePointer.copyMemory(from: UnsafeRawBufferPointer(start: baseAddress, count: size))
//                       }
//                   }
//               }
//        
//        // PNGs and network data are Big Endian;
//        // Swap to .littleEndian if your source is from a Windows/Intel system.
//        let decoded = Int64(bigEndian: value)
//        
//        return Int(truncatingIfNeeded: decoded).uInt8
//    }
    
//    private var isPNGData: Bool {
//        // The first 8 bytes of a PNG file in hexadecimal: 89 50 4E 47 0D 0A 1A 0A
//        let pngSignature: [UInt8] = [137, 80, 78, 71, 13, 10, 26, 10]
//        
//        guard self.count >= pngSignature.count else {
//            return false
//        }
//        
//        let prefix = self.prefix(pngSignature.count)
//        return prefix.elementsEqual(pngSignature)
//    }
    
}
