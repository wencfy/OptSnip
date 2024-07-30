//
//  SnipContent.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import SwiftUI

struct SnipContent: View {
    @StateObject var area: SnipAreaViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .onHover { inside in
                if inside {
                    NSCursor.crosshair.push()
                } else {
                    NSCursor.pop()
                }
            }
            .position(area.offset + area.dragOffset)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragOffset = value.translation
                    }
                    .onEnded { value in
                        area.dragOffset = .zero
                        area.offset = area.offset + value.translation
                        area.isDragging = false
                    }
            )
            .frame(width: abs(area.size.width), height: abs(area.size.height))
    }
}
