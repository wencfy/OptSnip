//
//  HollowView.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/21.
//

import SwiftUI

struct Window: Shape {
    let size: CGSize
    let center: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        
        path.addRect(CGRect(origin: center - size / 2, size: size))
        return path
    }
}

struct HollowView: View {
    @StateObject var area: SnipAreaViewModel;
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .mask(
                    Window(size: area.size, center: area.offset + area.dragOffset).fill(style: FillStyle(eoFill: true))
                )
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            area.dragOffset = value.translation
                        }
                        .onEnded { value in
                            area.offset = area.offset + value.translation
                            area.dragOffset = .zero
                        }
                )
        }
    }
}
