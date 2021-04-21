//
//  BasicCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 27..
//

import Foundation
import SwiftUI

/// Represents a drawable weapon type card
class PlayableCard: DrawableCard {
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let cardType: CardType = CardType.playable
    var cardImageName: String = "backCard"
    let cardName: PlayableType
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.cardName = cardName
    }
    
    func play() -> Bool {
        return false
    }
}
