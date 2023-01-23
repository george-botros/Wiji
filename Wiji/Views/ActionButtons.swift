import SwiftUI

enum ButtonTypes {
  case run
  case next
  case cancel
}

struct ActionButtons: View {
  @ObservedObject var viewModel: ContentViewModel

  var body: some View {
    HStack(spacing: 10) {
      Button("􀆧 Cancel") { viewModel.cancelAction() }
        .buttonStyle(ActionButtonStyle(type: .cancel))
      Spacer()
      Button("􀅂 Next") { viewModel.nextAction() }
        .buttonStyle(ActionButtonStyle(type: .next))
      Button("􀅇 Run") { viewModel.submitQueryOrRunAction() }
        .buttonStyle(ActionButtonStyle(type: .run))
    }
  }
}

struct ActionButtonStyle: ButtonStyle {
  var type: ButtonTypes

  func getForegroundColor() -> Color {
    switch self.type {
    case .run:
      return .white
    case .next:
      return .blue
    case .cancel:
      return .red
    }
  }

  func getBackgroundColor() -> Color {
    switch self.type {
    case .run:
      return .blue
    case .next:
      return .blueTint
    case .cancel:
      return .redTint
    }
  }

  func makeBody(configuration: Configuration) -> some View {
    HStack() {
      configuration.label
        .foregroundColor(getForegroundColor())
    }
    .padding(10)
    .background(getBackgroundColor().cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct ActionButtons_Previews: PreviewProvider {
    static var previews: some View {
      ActionButtons(viewModel: ContentViewModel())
    }
}
