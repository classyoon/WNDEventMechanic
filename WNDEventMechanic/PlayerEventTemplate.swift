//
//  PlayerEventTemplate.swift
//  WNDEventMechanic
//
//  Created by Conner Yoon on 12/17/23.
//

import Foundation
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
