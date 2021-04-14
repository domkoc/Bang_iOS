//
//  BartCassidyCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation

class BartCassidyCharacter: Character {
    
    override init(name: CharacterType = .bartCassidy, maxLifeCount: Int = 4) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func takeLife() {
        super.takeLife()
        drawCard()
    }
    
}
