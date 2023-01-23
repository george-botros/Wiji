import AppKit

class StatusBarController {
  private var statusBar: NSStatusBar
  private(set) var statusItem: NSStatusItem

  init() {
    statusBar = .init()
    statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)

    if let button = statusItem.button {
      button.image = NSImage(named: "StatusBarIcon")
      button.action = #selector(toggleApp)
      button.target = self
    }
  }

  @objc func toggleApp() {
    NSApp.toggleActivity()
  }
}
