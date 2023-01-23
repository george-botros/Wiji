import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ContentViewModel()
  @FocusState private var focusedField: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 25) {
      Prompt(text: "How can I help you?")

      QueryField(viewModel: viewModel)
        .focused($focusedField)

      if viewModel.queryState == .submitted || viewModel.queryState == .done {
        ActionList(actions: dummyActions,
          selectedIndex: viewModel.selectedAction,
          highlightedIndex: viewModel.highlightedAction)
        ActionButtons(viewModel: viewModel)
      }
    }
    .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
      focusedField = true
    }
    .frame(width: contentViewWidth)
    .padding(contentViewPadding)
    .background(Color("background"))
    .background(.ultraThinMaterial)
    .cornerRadius(8)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().preferredColorScheme(.light)
    ContentView().preferredColorScheme(.dark)
  }
}

struct Prompt: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title3)
      .fontWeight(.heavy)
  }
}
