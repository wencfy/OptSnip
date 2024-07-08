//
//  SnipArea.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import Foundation

class SnipArea: ObservableObject {
    @Published var offset: CGPoint
    @Published var size: CGPoint
    
    init(offset: CGPoint, size: CGPoint) {
        self.offset = offset
        self.size = size
    }
    
    
}
