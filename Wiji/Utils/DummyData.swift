import Foundation

var dummyActions: [Action] = [
  Action(type: .click, description: "Click link labeled 'Marketplace' in the top left"),
  Action(type: .redirect, description: "Redirect to'/marketplace/'"),
  Action(type: .scroll, description: "Scroll to text 'Marketplace'"),
  Action(type: .redirect, description: "Redirect to'facebook.com/marketplace/'"),
  Action(type: .consultModel, description: "Ask GPT-3 how to 'go to marketplace'")
]
