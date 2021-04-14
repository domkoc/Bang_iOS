//
//  GatlingCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation
import SwiftUI

class GatlingCard: PlayableCard {
    
    
    override func play() -> Bool {
        for player in Game.shared.players {
            player.character.takeLife()
        }
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName)
        var bangImgeText = "brownGatling_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImage = Image(bangImgeText)
    }
}
