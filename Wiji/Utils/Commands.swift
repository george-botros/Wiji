import AppKit

enum CommandType: String {
  case tab
  case enter
  case escape
  case none
}

func selectorToType(for command: Selector) -> CommandType {
  switch command {
  case #selector(NSStandardKeyBindingResponding.insertNewline(_:)) :
    return .enter
  case #selector(NSStandardKeyBindingResponding.insertTab(_:)) :
    return .tab
  case #selector(NSStandardKeyBindingResponding.cancelOperation(_:)) :
    return .escape
  default:
    return .none
  }
}
