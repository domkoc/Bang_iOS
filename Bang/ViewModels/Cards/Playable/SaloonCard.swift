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
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownSaloon_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
