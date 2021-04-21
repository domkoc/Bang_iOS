//
//  PaulRegretCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class PaulRegretCharacter: Character {
    
    override init(name: CharacterType = .paulRegret, maxLifeCount: Int = 3, cardImageName: String = "charaPaulRegret") throws {
        try super.init(name: .paulRegret, maxLifeCount: 3, cardImageName: "charaPaulRegret")
    }
    
    override func defaultDistance() -> Int {
        return 1
    }
}
