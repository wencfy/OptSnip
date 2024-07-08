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
            .stroke(Color.accentColor)
            .fill(Color.accentColor)
            .position(area.offset + area.dragOffset)
            .frame(width: area.size.width, height: area.size.height, alignment: .center)
            .opacity(0.1)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        area.dragOffset = value.translation
                    }
                    .onEnded { value in
                        area.dragOffset = .zero
                        area.offset = area.offset + value.translation
                    }
            )
    }
}
