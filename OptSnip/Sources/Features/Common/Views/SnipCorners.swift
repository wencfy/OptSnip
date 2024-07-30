//
//  SnipCorners.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import SwiftUI

struct SnipCorners: View {
    @StateObject var area: SnipAreaViewModel
    private let cornerRadius = 6.0
    private let cornerLength = 0.0
    
    var body: some View {
        let len = cornerRadius + cornerLength
        let weight = 1.0
        
        createCornersPath(cornerRadius: cornerRadius, cornerLength: cornerLength, corner: .topLeft)
            .stroke(Color.accentColor, lineWidth: weight)
            .onHover { hovering in
                if hovering {
                    NSCursor(
                        image: NSImage(named: "resizenorthwest")!,
                        hotSpot: NSPoint(x: 16, y: 16)).push()
                } else {
                    NSCursor.pop()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragCorner(translation: value.translation, corner: .topLeft)
                    }
            )
            .position(area.cornerPos(corner: .topLeft))
            .frame(width: len, height: len)
        
        createCornersPath(cornerRadius: cornerRadius, cornerLength: cornerLength, corner: .topRight)
            .stroke(Color.accentColor, lineWidth: weight)
            .onHover { hovering in
                if hovering {
                    NSCursor(
                        image: NSImage(named: "resizenortheast")!,
                        hotSpot: NSPoint(x: 16, y: 16)).push()
                } else {
                    NSCursor.pop()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragCorner(translation: value.translation, corner: .topRight)
                    }
            )
            .position(area.cornerPos(corner: .topRight))
            .frame(width: len, height: len)
        
        createCornersPath(cornerRadius: cornerRadius, cornerLength: cornerLength, corner: .bottomLeft)
            .stroke(Color.accentColor, lineWidth: weight)
            .onHover { hovering in
                if hovering {
                    NSCursor(
                        image: NSImage(named: "resizesouthwest")!,
                        hotSpot: NSPoint(x: 16, y: 16)).push()
                } else {
                    NSCursor.pop()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragCorner(translation: value.translation, corner: .bottomLeft)
                    }
            )
            .position(area.cornerPos(corner: .bottomLeft))
            .frame(width: len, height: len)
        
        createCornersPath(cornerRadius: cornerRadius, cornerLength: cornerLength, corner: .bottomRight)
            .stroke(Color.accentColor, lineWidth: weight)
            .onHover { hovering in
                if hovering {
                    NSCursor(
                        image: NSImage(named: "resizesoutheast")!,
                        hotSpot: NSPoint(x: 16, y: 16)).push()
                } else {
                    NSCursor.pop()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragCorner(translation: value.translation, corner: .bottomRight)
                    }
            )
            .position(area.cornerPos(corner: .bottomRight))
            .frame(width: len, height: len)
    }
    
    private func createCornersPath(
        cornerRadius: CGFloat,
        cornerLength: CGFloat = 0,
        corner: Corner
    ) -> Path {
        var path = Path()
        
        switch corner {
        case .topLeft:
            path.move(to: CGPoint(x: 0, y: cornerRadius))
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 180.0),
                endAngle: Angle(degrees: 270.0),
                clockwise: false
            )
            
            break
        case .topRight:
            path.move(to: CGPoint(x: cornerLength, y: 0))
            path.addArc(
                center: CGPoint(x: cornerLength, y: cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 270.0),
                endAngle: Angle(degrees: 360.0),
                clockwise: false
            )
            
            break
        case .bottomRight:
            path.move(to: CGPoint(x: cornerLength + cornerRadius, y: cornerLength))
            path.addArc(
                center: CGPoint(x: cornerLength, y: cornerLength),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0.0),
                endAngle: Angle(degrees: 90.0),
                clockwise: false
            )
            
            break
        case .bottomLeft:
            path.move(to: CGPoint(x: cornerRadius, y: cornerLength + cornerRadius))
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerLength),
                radius: cornerRadius,
                startAngle: Angle(degrees: 90.0),
                endAngle: Angle(degrees: 180.0),
                clockwise: false
            )
            
            break
        }
        
        return path
    }
}

enum Corner {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft
}
