//
//  SnipArea.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/12.
//

import SwiftUI

struct SnipArea: View {
    @StateObject var area: SnipAreaViewModel
    
    var body: some View {
        ZStack {
            SnipContent(area: area)
            SnipCorners(area: area)
        }
    }
}
