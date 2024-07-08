//
//  SnipAreaViewModel.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import Foundation

class SnipAreaViewModel: ObservableObject {
    @Published var offset: CGPoint
    @Published var size: CGSize
    @Published var dragOffset: CGSize = .zero
    
    init(offset: CGPoint, size: CGSize) {
        self.offset = offset
        self.size = size
    }
    
    public func dragCorner(translation: CGSize, corner: Corner) {
        self.offset = self.offset + translation / 2
        
        switch corner {
        case .topLeft:
            self.size.width -= translation.width
            self.size.height -= translation.height
            break
        case .topRight:
            self.size.width += translation.width
            self.size.height -= translation.height
            break
        case .bottomRight:
            self.size.width += translation.width
            self.size.height += translation.height
            break
        case .bottomLeft:
            self.size.width -= translation.width
            self.size.height += translation.height
            break
        }
        
        return
    }
}

extension CGPoint {
    static public func +(left: Self, right: CGSize) -> Self {
        return CGPoint(x: left.x + right.width, y: left.y + right.height)
    }
}

extension CGSize {
    static public func /(left: Self, right: CGFloat) -> Self {
        return CGSize(width: left.width / right, height: left.height / right)
    }
    
    static public func -(left: Self, right: Self) -> Self {
        return CGSize(width: left.width - right.width, height: left.height - right.height)
    }
}
