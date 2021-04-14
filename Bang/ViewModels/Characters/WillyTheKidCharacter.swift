//
//  WillyTheKidCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class WillyTheKidCharacter: Character {
    override init(name: CharacterType = .willyTheKid, maxLifeCount: Int = 4) throws {
            try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    // TODO: Bangeken nincs limit
}
