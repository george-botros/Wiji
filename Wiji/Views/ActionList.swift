import SwiftUI

struct ListItem: View {
  var action: Action
  var selected: Bool
  var highlighted: Bool
  var last: Bool

  var body: some View {
    VStack() {
      HStack() {
        Image(systemName: action.image)
        Text(action.description)
        Spacer()
      }
      .foregroundColor(selected ? .red : (highlighted ? .blue : .primary))
      .padding(8)
      .background(.ultraThinMaterial)
      .background(
        selected ? Color.redTint : (highlighted ? .blueTint : .clear)
      )
    }
    if !last {
      Divider()
    }
  }
}

struct TopHits: View {
  var body: some View {
    Text("Top Hits")
      .foregroundColor(.blue)
      .font(.caption2)
      .padding(10)
  }
}

struct ActionList: View {
  var actions: [Action]
  var selectedIndex: Int?
  var highlightedIndex: Int?

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Section(header: TopHits()) {
        VStack(spacing: 0) {
          ForEach(Array(actions.enumerated()), id: \.element.id) { index, action in
            ListItem(
              action: action,
              selected: selectedIndex == index,
              highlighted: highlightedIndex == index,
              last: index == actions.count - 1
            )
          }
        }.cornerRadius(10)
      }
    }
  }
}

struct ActionList_Previews: PreviewProvider {
    static var previews: some View {
      ActionList(actions: dummyActions, selectedIndex: 0, highlightedIndex: 2)
      ActionList(actions: dummyActions, selectedIndex: 0, highlightedIndex: 4).preferredColorScheme(.light)
    }
}
