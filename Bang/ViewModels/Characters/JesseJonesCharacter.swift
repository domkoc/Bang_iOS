//
//  JesseJonesCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class JesseJonesCharacter: Character {
    
    override init(name: CharacterType = .jesseJones, maxLifeCount: Int = 4, cardImageName: String = "charaJesseJones") throws {
        try super.init(name: .jesseJones, maxLifeCount: 4, cardImageName: "charaJesseJones")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        var drawnCards: [DrawableCard] = []
        if n == 2 {
            drawnCards.append(contentsOf: drawCard())
            drawnCards.append(contentsOf: drawCard()) // TODO: From others hand
            
        }
        else {
            drawnCards.append(contentsOf: drawCard(n: n))
        }
        return drawnCards
    }
    
}
