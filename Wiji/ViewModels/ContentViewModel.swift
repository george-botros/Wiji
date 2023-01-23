import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var query: String = ""
  @Published var highlightedAction: Int?
  @Published var selectedAction: Int?
  @Published var queryState: QueryState = .editing

  func nextAction() {
    highlightedAction? += 1
  }

  func cancelAction() {
    NSApp.makeInactive(andAfterAnimation: reset)
  }

  func submitQueryOrRunAction() {
    if queryState == .editing {
      withAnimation(.easeInOut(duration: animationDuration)) { queryState = .submitted }
      highlightedAction = 0
    } else if queryState == .submitted {
      withAnimation(.easeInOut(duration: animationDuration)) { queryState = .done }
      selectedAction = highlightedAction
      highlightedAction = nil
    }
  }

  func unsubmit() {
    withAnimation(.easeInOut(duration: animationDuration)) {
      queryState = .editing
      selectedAction = nil
      highlightedAction = nil
    }
  }

  func reset() {
    unsubmit()
    query = ""
  }
}
