//
//  AppMenu.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/10.
//

import SwiftUI

struct AppMenu: View {
    let controller = TransparentWindowController()
    
    var body: some View {
        Button(action: {
            controller.showWindow(nil)
        }, label: { Text("click me") })
    }
}
