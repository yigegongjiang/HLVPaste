//
//  HLVPasteApp.swift
//  HLVPaste
//
//  Created by gebiwanger on 2024/1/14.
//

import SwiftUI

extension DispatchQueue {
    private static var _onceTracker = [String]()

    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }

        if _onceTracker.contains(token) {
            return
        }

        _onceTracker.append(token)
        block()
    }
}

@main
struct HLVPasteApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppear {
          DispatchQueue.once(token: "com.hlvpaste.app") {
            if let window = NSApplication.shared.windows.first {
              window.isOpaque = false
              window.backgroundColor = NSColor.clear
              window.titleVisibility = .hidden
              window.titlebarAppearsTransparent = true
              window.styleMask.insert(.fullSizeContentView)
              window.styleMask.remove(.titled)
              //            window.styleMask.remove(.closable)
              //            window.styleMask.remove(.miniaturizable)
              //            window.styleMask.remove(.resizable)
            }
          }

        }
    }
//    .windowStyle(.hiddenTitleBar)
  }
}
