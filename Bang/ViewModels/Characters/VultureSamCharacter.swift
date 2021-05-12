//
//  VultureSamCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class VultureSamCharacter: Character {
    override init(name: CharacterType = .vultureSam, maxLifeCount: Int = 4, cardImageName: String = "charaVultureSam") throws {
        try super.init(name: .vultureSam, maxLifeCount: 4, cardImageName: "charaVultureSam")
    }
}
