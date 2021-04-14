//
//  GeneralStoreCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation
import SwiftUI

class PanicCard: PlayableCard {
    override func play() -> Bool {
        Game.shared.selectTarget()
        let target = Game.shared.currentTarget!
        let player = Game.shared.currentPlayer
        let distance = player!.character.calculateDistanceFrom(selfIndex: Game.shared.players.firstIndex(of: player!)!,
                                                              targetIndex: Game.shared.players.firstIndex(of: target)!)
        if  distance > 1{
            return false
        } else {
            //TODO: Select card to get
            let card: DrawableCard = target.character.takeCard(type: .playable, index: 0)!
            Game.shared.currentPlayer!.character.hand.append(card)
            return true
        }
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName)
        var bangImgeText = "brownPanic_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImage = Image(bangImgeText)
    }
}
