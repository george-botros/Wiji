import AppKit

extension WidgetWindow {

  private func computeOffScreenRect() -> NSRect {
    let screenFrame = NSScreen.main!.visibleFrame
    let offScreenRect = NSRect(x: screenFrame.width, y: 0, width: windowWidth, height: screenFrame.height)
    return offScreenRect
  }

  private func computeOnScreenRect() -> NSRect {
    let screenFrame = NSScreen.main!.visibleFrame
    let screenWidth = screenFrame.width, screenHeight = screenFrame.height
    let xCorner = screenWidth - self.frame.width - distanceFromSideOfScreen
    let onScreenRect = NSRect(x: xCorner, y: 0, width: windowWidth, height: screenHeight)
    return onScreenRect
  }

  func slide(direction: Direction) {
    NSAnimationContext.runAnimationGroup({ context in
        context.duration = animationDuration
        let destinationFrame = direction == .onscreen ? computeOnScreenRect() : computeOffScreenRect()
        self.animator().setFrame(destinationFrame, display: false, animate: true)
    })
  }

}
