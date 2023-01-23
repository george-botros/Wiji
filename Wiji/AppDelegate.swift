import AppKit
import SwiftUI
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {

  private var slidingWindow: WidgetWindow!
  private var statusBar: StatusBarController?
  private var hostingView: NSHostingView<AnyView>!
  private var contentView: any View

  init(contentView: some View) {
    self.contentView = contentView
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    createWidgetWindow()
    slidingWindow.orderFront(nil)
    slidingWindow.makeKey()
    statusBar = StatusBarController()
  }

  func applicationWillBecomeActive(_ notification: Notification) {
    NSApp.getWindow()!.slide(direction: .onscreen)
  }

  func applicationWillResignActive(_ notification: Notification) {
    NSApp.getWindow()!.slide(direction: .offscreen)
  }

  private let hotKey = HotKey(key: .f, modifiers: [.command, .shift], keyDownHandler: {
    NSApp.toggleActivity()
  })

  private func createWidgetWindow() {
    hostingView = AnimatedHostView(rootView: AnyView(contentView))
    let containerView = FlippedView()
    containerView.addSubview(hostingView)
    slidingWindow = WidgetWindow()
    slidingWindow.contentView = containerView
  }
}
