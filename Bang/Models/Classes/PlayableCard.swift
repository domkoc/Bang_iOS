//
//  BasicCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 27..
//

import Foundation
import SwiftUI

/// Represents a drawable weapon type card
class PlayableCard: DrawableCard, Equatable {
    static func == (lhs: PlayableCard, rhs: PlayableCard) -> Bool {
        return lhs.cardImageName == rhs.cardImageName
    }
    
    
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let cardType: CardType = CardType.playable
    var cardImageName: String = "backCard"
    let cardName: PlayableType
    let cardSheetType: sheetType?
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType? = nil) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.cardName = cardName
        self.cardSheetType = cardSheetType
    }
    
    func play() -> Bool {
        return false
    }
}
