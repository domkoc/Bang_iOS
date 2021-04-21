//
//  CatBalouCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 27..
//

import Foundation
import SwiftUI

class CatBalouCard: PlayableCard {
    override func play() -> Bool {
        Game.shared.selectTarget()
        let target = Game.shared.currentTarget!
        //TODO: Select card to drop
        target.character.takeCard(type: .playable, index: 0)
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName)
        var bangImgeText = "brownCatBalou_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
