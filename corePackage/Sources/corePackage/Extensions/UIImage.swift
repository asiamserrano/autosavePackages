//
//  UIImage.swift
//  autosave
//
//  Created by Asia Michelle Serrano on 5/7/25.
//

import Foundation
import SwiftUI

extension UIImage {
        
    public static func < (lhs: UIImage, rhs: UIImage) -> Bool {
        lhs.id < rhs.id
    }
    
    public var id: String {
        self.pngData?.description ?? .defaultValue
    }
    
}

public extension UIImage {
    
    static func == (lhs: UIImage, rhs: UIImage) -> Bool {
        lhs.pngData?.hashValue == rhs.pngData?.hashValue
    }
    
    var pngData: Data? {
        self.pngData()
    }
    
    var isEmpty: Bool {
        self.pngData == nil
    }
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    convenience init?(_ d: Data?) {
        if let data: Data = d {
            self.init(data: data)
        } else {
            self.init()
        }
    }
    
}
