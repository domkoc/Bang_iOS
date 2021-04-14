//
//  Jourdonnais.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class JourdonnaisCharacter: Character {
    
    override init(name: CharacterType = .jourdonnais, maxLifeCount: Int = 4) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func takeLife() {
        let card = drawCard(keep: false).first
        if !(card!.cardSuit == .Hearths) {
            super.takeLife()
        }
    }
}
