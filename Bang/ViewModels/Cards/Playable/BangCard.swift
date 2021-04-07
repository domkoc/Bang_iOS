//
//  BangCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 27..
//

import Foundation
import SwiftUI

class BangCard: PlayableCard {
    
    
    override func play() -> Bool {
        let target = Game.shared.currentTarget!
        let player = Game.shared.currentPlayer
        let distance = player.character.calculateDistanceFrom(selfIndex: Game.shared.players.firstIndex(of: player)!,
                                                              targetIndex: Game.shared.players.firstIndex(of: target)!)
        if  distance > player.character.weapon.weaponType.firePower{
            return false
        } else {
            target.character.takeLife()
            return true
        }
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber)
        var bangImgeText = "brownBang_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImage = Image(bangImgeText)
    }
}
