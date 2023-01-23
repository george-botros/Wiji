import AppKit
import SwiftUI

class WidgetWindow: NSWindow {

  init() {
    let screenSize = NSScreen.main!.visibleFrame.size
    let initialRect = NSRect(x: screenSize.width, y: screenSize.height, width: windowWidth, height: screenSize.height)
    super.init(contentRect: initialRect, styleMask: [.fullSizeContentView], backing: .buffered, defer: true)
    self.level = .floating
    self.collectionBehavior.insert(.fullScreenAuxiliary)
    self.backgroundColor = .clear
  }

  override var canBecomeKey: Bool {
    return true
  }

}
