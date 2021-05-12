//
//  KitCarlsonCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class KitCarlsonCharacter: Character {
    
    override init(name: CharacterType = .kitCarlson, maxLifeCount: Int = 4, cardImageName: String = "charaKitCarlson") throws {
        try super.init(name: .kitCarlson, maxLifeCount: 4, cardImageName: "charaKitCarlson")
    }

    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 2 {
            var cards: [DrawableCard] = []
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            Game.shared.drawDeck.append(cards.remove(at: 0))
            hand.append(cards[0])
            hand.append(cards[1])
            return cards
        } else {
            return super.drawCard(n: n, keep: keep)
        }
    }
}
