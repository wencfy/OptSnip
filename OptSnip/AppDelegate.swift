//
//  AppDelegate.swift
//  OptSnip
//
//  Created by wallace wen on 2024/7/9.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = TransparentWindowController()
        controller.showWindow(nil)
    }
}
