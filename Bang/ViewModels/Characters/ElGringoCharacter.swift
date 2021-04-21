//
//  ElGringoCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class ElGringoCharacter: Character {
    
    override init(name: CharacterType = .elGringo, maxLifeCount: Int = 3, cardImageName: String = "charaElGringo") throws {
        try super.init(name: .elGringo, maxLifeCount: 3, cardImageName: "charaElGringo")
    }
    
    override func takeLife() {
        super.takeLife()
        drawCard() //TODO: From hand
    }
}
