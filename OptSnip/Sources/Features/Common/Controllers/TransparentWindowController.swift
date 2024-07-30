//
//  TransparentWindowController.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import Cocoa
import SwiftUI

class TransparentWindowController: NSWindowController, NSWindowDelegate {
    convenience init() {
        let contentView = TransparentView().edgesIgnoringSafeArea(.all)
        let hostingController = NSHostingController(rootView: contentView)
        let window = NSWindow(
            contentViewController: hostingController
        )
        self.init(window: window)
        
        configureWindow()
        window.delegate = self
    }
    
    func configureWindow() {
        self.window?.styleMask = [.borderless]
        self.window?.titlebarAppearsTransparent = true
        self.window?.isMovableByWindowBackground = true
        self.window?.backgroundColor = NSColor.clear
        self.window?.isOpaque = false
        
        self.window?.ignoresMouseEvents = false
        self.window?.center()
        self.window?.level = .statusBar // Set window level to statusBar or higher
        self.window?.isMovable = false
    }
    
    override func showWindow(_ sender: Any?) {
        print("Show Window Called!")
        super.showWindow(sender)
        self.window?.setFrame(NSScreen.main?.frame ?? .zero, display: true)
    }
    
    
}
