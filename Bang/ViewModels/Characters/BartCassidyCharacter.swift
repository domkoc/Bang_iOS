//
//  BartCassidyCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation

class BartCassidyCharacter: Character {
    
    override init(name: CharacterType = .bartCassidy, maxLifeCount: Int = 4, cardImageName: String = "charaBartCassidy") throws {
        try super.init(name: .bartCassidy, maxLifeCount: 4, cardImageName: "charaBartCassidy")
    }
    
    override func takeLife() {
        super.takeLife()
        drawCard()
    }
    
}
