//
//  SnipAreaViewModel.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import Foundation
import SwiftUI

class SnipAreaViewModel: ObservableObject {
    @Published var offset: CGPoint
    @Published var size: CGSize
    @Published var dragOffset: CGSize = .zero
    @Published var isDragging: Bool
    
    init(offset: CGPoint, size: CGSize) {
        self.offset = offset
        self.size = size
        self.isDragging = false
    }
    
    public func dragCorner(translation: CGSize, corner: Corner) {
        self.offset = self.offset + translation / 2
        self.isDragging = true
        
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
    
    public func cornerPos(corner: Corner) -> CGPoint {
        let pos = self.offset + self.dragOffset
        
        switch corner {
        case .topLeft:
            return pos - self.size / 2
        case .topRight:
            return CGPoint(x: pos.x + self.size.width / 2, y: pos.y - self.size.height / 2)
        case .bottomLeft:
            return CGPoint(x: pos.x - self.size.width / 2, y: pos.y + self.size.height / 2)
        case .bottomRight:
            return pos + self.size / 2
        }
    }
    
    public func create(value: DragGesture.Value) {
        self.offset = value.startLocation + value.translation / 2
        self.size = value.translation
    }
}

extension CGPoint {
    static public func +(left: Self, right: CGSize) -> Self {
        return CGPoint(x: left.x + right.width, y: left.y + right.height)
    }
    
    static public func -(left: Self, right: CGSize) -> Self {
        return CGPoint(x: left.x - right.width, y: left.y - right.height)
    }
}

extension CGSize {
    static public func /(left: Self, right: CGFloat) -> Self {
        return CGSize(width: left.width / right, height: left.height / right)
    }
    
    static public func -(left: Self, right: Self) -> Self {
        return CGSize(width: left.width - right.width, height: left.height - right.height)
    }
    
    static public func >(left: Self, right: Self) -> Bool {
        return left.width > right.width && left.height > right.width
    }
}
