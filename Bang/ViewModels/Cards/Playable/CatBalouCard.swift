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
        let target = Game.shared.currentTarget!
        let card = target.character.takeCard(type: Game.shared.selectedCardType!, index: Game.shared.currentTargetCardIndex!)
        Game.shared.currentPlayer?.character.addCard(card: card!)
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownCatBalou_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
