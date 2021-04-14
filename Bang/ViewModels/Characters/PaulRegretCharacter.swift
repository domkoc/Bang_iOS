//
//  PaulRegretCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class PaulRegretCharacter: Character {
    
    override init(name: CharacterType = .paulRegret, maxLifeCount: Int = 3) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func defaultDistance() -> Int {
        return 1
    }
}
