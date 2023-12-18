//
//  PlayerEvents.swift
//  WNDEventMechanic
//
//  Created by Conner Yoon on 12/17/23.
//

import Foundation
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
