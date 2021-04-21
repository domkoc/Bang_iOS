//
//  Jourdonnais.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class JourdonnaisCharacter: Character {
    
    override init(name: CharacterType = .jourdonnais, maxLifeCount: Int = 4, cardImageName: String = "charaJourdonnais") throws {
        try super.init(name: .jourdonnais, maxLifeCount: 4, cardImageName: "charaJourdonnais")
    }
    
    override func takeLife() {
        let card = drawCard(keep: false).first
        if !(card!.cardSuit == .Hearths) {
            super.takeLife()
        }
    }
}
