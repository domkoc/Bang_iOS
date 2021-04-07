//
//  SaloonCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation
import SwiftUI

class SaloonCard: PlayableCard {
    override func play() -> Bool {
        for player in Game.shared.players {
            player.character.gainLife()
        }
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber)
        var bangImgeText = "brownSaloon_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImage = Image(bangImgeText)
    }
}
