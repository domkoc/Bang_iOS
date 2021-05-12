//
//  SidKetchumCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class SidKetchumCharacter: Character {
    override init(name: CharacterType = .sidKetchum, maxLifeCount: Int = 4, cardImageName: String = "charaSidKetchum") throws {
        try super.init(name: .sidKetchum, maxLifeCount: 4, cardImageName: "charaSidKetchum")
    }
    
    override func usePower() -> Bool {
        if hand.count >= 2 {
            Game.shared.playedDeck.append(hand.remove(at: 0))
            Game.shared.playedDeck.append(hand.remove(at: 0))
            gainLife()
            return true
        } else {
            return false
        }
    }
}
