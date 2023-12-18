//
//  Dependencies.swift
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
