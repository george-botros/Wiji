import SwiftUI

class AnimatedHostView: NSHostingView<AnyView> {

  override func viewDidMoveToWindow() {
    self.setFrameOrigin(NSPoint(x: 0.0, y: distanceFromSideOfScreen))
    let nc = NotificationCenter.default
    nc.addObserver(forName: NSView.frameDidChangeNotification, object: nil, queue: .main, using: respond)
  }

  private func respond(to notification: Notification) {
    guard let view = notification.object as? NSView else { return }
    // if the notification came from a SwiftUI view with the width we expect, we'll assume its the main content view:
    if view.className == "SwiftUI._NSGraphicsView" && view.frame.width == windowWidth {
      DispatchQueue.main.async() {
        self.setFrameSize(view.frame.size)
      }
    }
  }

}
