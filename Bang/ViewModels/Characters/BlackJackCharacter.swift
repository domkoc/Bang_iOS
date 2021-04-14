//
//  BlackJackCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class BlackJackCharacter: Character {
    
    override init(name: CharacterType = .blackJack, maxLifeCount: Int = 4) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        var newCards = super.drawCard(n: n)
        if  newCards.count >= 2{
            if newCards[1].cardSuit == .Hearths || newCards[1].cardSuit == .Diamonds {
                newCards.append(contentsOf: super.drawCard())
            }
        }
        return newCards
    }
}
