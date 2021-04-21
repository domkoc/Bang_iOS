//
//  SuzyLafayetteCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class SuzyLafayetteCharacter: Character {
    override init(name: CharacterType = .suzyLafayette, maxLifeCount: Int = 4, cardImageName: String = "charaSuzyLafayette") throws {
        try super.init(name: .suzyLafayette, maxLifeCount: 4, cardImageName: "charaSuzyLafayette")
    }
    
    override func takeCard(type: CardType, index: Int) -> DrawableCard? {
        let returnvalue = super.takeCard(type: type, index: index)
        if hand.isEmpty {
            drawCard()
        }
        return returnvalue
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        let returnvalue = super.UseCard(index: index, expectedPlayableCardTypes: expectedPlayableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
        if hand.isEmpty {
            drawCard()
        }
        return returnvalue
    }
}
