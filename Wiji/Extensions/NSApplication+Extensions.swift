import AppKit

typealias CompletionHandler = () -> Void

enum Direction {
  case onscreen
  case offscreen
}

extension NSApplication {

  func getWindow() -> WidgetWindow? {
    return self.windows.first! as? WidgetWindow
  }

  func toggleActivity() {
    if self.isActive {
      makeInactive()
    } else {
      NSApp.activate(ignoringOtherApps: true)
    }
  }

  func makeInactive(andAfterAnimation completionH: CompletionHandler? = nil) {
    NSAnimationContext.runAnimationGroup({ _ in
        NSApp.getWindow()!.slide(direction: .offscreen)
      }, completionHandler: {
        if completionH != nil {
          completionH!()
        }
        NSApp.hide(nil)
    })
  }

}
