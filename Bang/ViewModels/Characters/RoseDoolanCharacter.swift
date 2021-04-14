//
//  RoseDoolanCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class RoseDoolanCharacter: Character {
    override init(name: CharacterType = .roseDoolan, maxLifeCount: Int = 4) throws {
            try super.init(name: name, maxLifeCount: maxLifeCount)
        }
    
    override func minusDistance() -> Int {
        return 1
    }
}
