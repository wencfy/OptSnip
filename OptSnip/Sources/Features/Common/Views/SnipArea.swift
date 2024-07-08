//
//  SnipArea.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import SwiftUI

struct SnipArea: View {
    @StateObject var area = SnipAreaViewModel(
        offset: CGPoint(x: 100, y: 100),
        size: CGSize(width: 100, height: 100)
    )
    
    var body: some View {
        ZStack {
            SnipContent(area: area)
            SnipCorners(area: area)
        }
    }
}
