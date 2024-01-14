//
//  ContentView.swift
//  HLVPaste
//
//  Created by gebiwanger on 2024/1/14.
//

import AppKit
import SwiftUI

struct ContentView: View {
  
  @Environment(\.scenePhase) private var scenePhase
  
  @State var note: String = ""
  @FocusState var focus: Bool
  
  var body: some View {
    VStack {
      VStack {
        TextEditor(text: $note)
          .font(.system(size: 35, weight: .bold))
          .scrollContentBackground(.hidden)
          .foregroundStyle(Color.white)
          .background(Color.clear)
          .padding(.all, 8)
          .focusable(true)
          .focused($focus)
          .onAppear{
            DispatchQueue.once(token: "com.hlvpaste.body") {
              NotificationCenter.default.addObserver(forName: NSWindow.didBecomeMainNotification, object: nil, queue: .main) { _ in
                restore()
              }
              NotificationCenter.default.addObserver(forName: NSWindow.didResignMainNotification, object: nil, queue: .main) { _ in
                lost()
              }
              restore()
            }
          }
      }
      .background(Color.gray.opacity(0.7))
      .clipShape(RoundedRectangle(cornerRadius: 10)) // 设置圆角
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue.opacity(1.0), lineWidth: 2)) // 设置边框
      .frame(width:600,height:100)
    }
  }
  
  private func lost() {
    DispatchQueue.main.async {
      let pasteboard = NSPasteboard.general
      pasteboard.clearContents()
      pasteboard.writeObjects([note as NSPasteboardWriting])
    }
  }
  
  private func restore() {
//    if let r = NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) {
//      note = r
//    }

    note = ""
    
    if focus == false {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
        focus = true
      }
    }
  }
}

#Preview {
  ContentView()
}
