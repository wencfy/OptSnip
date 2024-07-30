//
//  TransparentView.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import SwiftUI

struct TransparentView: View {
    @StateObject var area = SnipAreaViewModel(
        offset: CGPoint(x: 200, y: 200), size: CGSize(width: 300, height: 300)
    )
    
    var body: some View {
            ZStack(alignment: .topLeading) {
//                Color.clear
//                    .contentShape(Rectangle())
//                    .gesture(
//                        DragGesture(minimumDistance: 0)
//                            .onChanged(area.create)
//                    )
                
                HollowView(area: area)
                
//                SnipContent(area: area)
////                    .blendMode(.destinationOut)
//                
//                SnipCorners(area: area)
                
            }
            
    }
}
