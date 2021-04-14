//
//  LuckyDukeCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class LuckyDukeCharacter: Character {
    
    override init(name: CharacterType = .luckyDuke, maxLifeCount: Int = 4) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 1 && keep == false{
            var cards: [DrawableCard] = []
            cards.append(contentsOf: super.drawCard(n: 2, keep: false))
            // TODO: Választás a két kártya közül
            return cards
        } else {
            return super.drawCard(n: n, keep: keep)
        }
    }
}
