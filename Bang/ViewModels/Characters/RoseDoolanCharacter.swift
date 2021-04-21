//
//  RoseDoolanCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class RoseDoolanCharacter: Character {
    override init(name: CharacterType = .roseDoolan, maxLifeCount: Int = 4, cardImageName: String = "charaRoseDoolan") throws {
        try super.init(name: .roseDoolan, maxLifeCount: 4, cardImageName: "charaRoseDoolan")
        }
    
    override func minusDistance() -> Int {
        return 1
    }
}
