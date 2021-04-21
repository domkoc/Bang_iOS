//
//  WillyTheKidCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class WillyTheKidCharacter: Character {
    override init(name: CharacterType = .willyTheKid, maxLifeCount: Int = 4, cardImageName: String = "charaWillyTheKid") throws {
        try super.init(name: .willyTheKid, maxLifeCount: 4, cardImageName: "charaWillyTheKid")
    }
    
    // TODO: Bangeken nincs limit
}
