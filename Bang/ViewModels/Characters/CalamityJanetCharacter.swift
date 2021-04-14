//
//  ClamityJanetCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class CalamityJanetCharacter: Character {
    
    override init(name: CharacterType = .calamityJanet, maxLifeCount: Int = 4) throws {
        try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        var playableCardTypes = expectedPlayableCardTypes
        if !playableCardTypes.contains(.bang) && playableCardTypes.contains(.missed) {
            playableCardTypes.append(.bang)
        }
        if !playableCardTypes.contains(.missed) && playableCardTypes.contains(.bang) {
            playableCardTypes.append(.missed)
        }
        return super.UseCard(index: index, expectedPlayableCardTypes: playableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
    }
    
    
}
