import AppKit
import SwiftUI

struct QueryField: NSViewRepresentable {

  @ObservedObject var viewModel: ContentViewModel

  func makeNSView(context: Context) -> NSTextField {
    let qField = NSTextField()
    qField.delegate = context.coordinator

    // styling
    qField.placeholderString = "Type to Walter"
    qField.isBordered = false
    qField.drawsBackground = false
    qField.focusRingType = .none

    return qField
  }

  func updateNSView(_ nsView: NSTextField, context: Context) {
  /* there's some wonkiness I don't wanna deal with rn.
    Ideally, I'd like to update the data in the textfield
    here whenever vm.query changes. However, that causes
    knock-on effects in the unsubmit funciton making it
    so it has to animate all parameters for some reason.
     A problem for another day. */
  }

}

extension QueryField {
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }

  class Coordinator: NSObject, NSTextFieldDelegate {
    var viewModel: ContentViewModel

    init(_ parent: QueryField) {
      self.viewModel = parent.viewModel
    }

    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
      switch selectorToType(for: commandSelector) {
      case .tab:
        viewModel.nextAction()
        return true
      case .escape:
        viewModel.cancelAction()
        return true
      case .enter:
        viewModel.submitQueryOrRunAction()
        return true
      default:
        return false
      }
    }

    func controlTextDidChange(_ obj: Notification) {
      viewModel.unsubmit()
      if let textField = obj.object as? NSTextField {
          viewModel.query = textField.stringValue
      }
    }

  }
}

enum QueryState {
  case editing
  case submitted
  case done
}
