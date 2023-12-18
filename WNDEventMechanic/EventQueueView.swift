//
//  EventQueueView.swift
//  WNDEventMechanic
//
//  Created by Conner Yoon on 12/17/23.
//

import SwiftUI

struct EventQueueView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
class EventQueue : ObservableObject {
    @Published var lineup : [PlayerEvent] = []
    func getFirstView()->some View {
        return Button(lineup[0].situation){self.lineup[0].buttonPressed = true; self.lineup.remove(at: 0)}
    }
}
#Preview {
    EventQueueView()
}
