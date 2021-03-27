//
//  PowerCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 26..
//

import Foundation
import SwiftUI

/// Represents a drawable power type card
class PowerCard: DrawableCard {
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let powerType: PowerType
    let cardType: CardType = CardType.power
    var cardImage: Image = Image("backCard")
    
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, powerType: PowerType) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.powerType = powerType
    }
}
