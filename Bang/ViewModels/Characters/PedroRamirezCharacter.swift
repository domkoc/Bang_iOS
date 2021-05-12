//
//  PedroRamirezCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class PedroRamirezCharacter: Character {
    override init(name: CharacterType = .pedroRamirez, maxLifeCount: Int = 4, cardImageName: String = "charaPedroRamirez") throws {
        try super.init(name: .pedroRamirez, maxLifeCount: 4, cardImageName: "charaPedroRamirez")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 2 && keep{
            var cards: [DrawableCard] = []
            cards.append(contentsOf: drawCard(keep: keep, toPlayed: toPlayed))
            cards.append(contentsOf: drawCard(keep: keep, toPlayed: toPlayed))
            return cards
        } else {
            return super.drawCard(n: n, keep: keep, toPlayed: toPlayed)
        }
    }
}
