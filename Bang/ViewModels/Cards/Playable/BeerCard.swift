//
//  BeerCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 27..
//

import Foundation
import SwiftUI

class BeerCard: PlayableCard {
    override func play() -> Bool {
        Game.shared.currentPlayer!.character.gainLife()
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName)
        var bangImgeText = "brownBeer_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
