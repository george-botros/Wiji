import Foundation

enum ActionTypes: String {
  case click
  case search
  case redirect
  case consultModel
  case scroll
}

struct Action: Identifiable {
  var type: ActionTypes
  var id = UUID()
  var description: String

  var image: String {
    switch type {
    case .click:
      return "cursorarrow.rays"
    case .search:
      return "magnifyingglass.circle.fill"
    case .redirect:
      return "globe"
    case .consultModel:
      return  "brain"
    case .scroll:
      return "arrow.up.arrow.down.circle"
    }
  }
}
