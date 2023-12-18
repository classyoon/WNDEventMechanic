//
//  Condition.swift
//  WNDEventMechanic
//
//  Created by Conner Yoon on 12/17/23.
//

import Foundation
import SwiftUI
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



