//
//  Condition.swift
//  WNDEventMechanic
//
//  Created by Conner Yoon on 12/17/23.
//

import Foundation
class Stockpile : ObservableObject {
    @Published var food = 10
}
class Survivors : ObservableObject {
    @Published var fight = false
}
class EventListener {
    @ObservedObject var stock : Stockpile
    @ObservedObject var survivors :Survivors
    @ObservedObject var queue : EventQueue
    var playerEvents : [PlayerEvent & Trigger] = []
   
    func checkConditions(){
        for playerEvent in playerEvents {
            if playerEvent.getTrigger() {
                queue.lineup.append(playerEvent)
            }
        }
    }
    init(stock: Stockpile, survivors: Survivors) {
        self.stock = stock
        self.survivors = survivors
        self.queue  =  EventQueue()
        self.playerEvents = [Starvation(stock), Obesisity(stock), Fight(survivors)]
    }
    
}
import SwiftUI
protocol Trigger {
    func getTrigger()->Bool
}
protocol ResourceAffected : Trigger {
    var stock : Stockpile { get }
}
protocol PersonAffected : Trigger {
    var survivors : Survivors { get }
}
class PlayerEvent {
    
    var situation = "We need food"
    var buttonPressed = false
    init(situation: String = "We need food", buttonPressed: Bool = false) {
        self.situation = situation
        self.buttonPressed = buttonPressed
    }
}
class Starvation : PlayerEvent, ResourceAffected  {
    var stock: Stockpile
    func getTrigger() -> Bool {
        if stock.food <= 0 {
            return true
        }
        return false
    }
    
    init(_ stock : Stockpile) {
        self.stock = stock
        super.init(situation: "Food please")
    }
}
class Obesisity : PlayerEvent, ResourceAffected {
    var stock: Stockpile
    func getTrigger() -> Bool {
        if stock.food >= 15 {
            return true
        }
        return false
    }
    init(_ stock : Stockpile) {
        self.stock = stock
        super.init(situation: "No food please")
    }
}
class Fight : PlayerEvent, PersonAffected {
    var survivors: Survivors
    func getTrigger() -> Bool {
        if survivors.fight {
            return true
        }
        return false
    }
    init(_ survivors : Survivors) {
        self.survivors = survivors
        super.init(situation: "Fight club")
    }
    
}
import SwiftUI
class EventQueue : ObservableObject {
    @Published var lineup : [PlayerEvent] = []
    func getFirstView()->some View {
        return Button(lineup[0].situation){self.lineup[0].buttonPressed = true; self.lineup.remove(at: 0)}
    }
}
