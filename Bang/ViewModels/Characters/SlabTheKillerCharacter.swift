//
//  SlabTheKillerCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class SlabTheKillerCharacter: Character {
    override init(name: CharacterType = .slabTheKiller, maxLifeCount: Int = 4) throws {
            try super.init(name: name, maxLifeCount: maxLifeCount)
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        if hand[index].cardType == .playable {
            let card = hand.remove(at: index) as! PlayableCard
            var played = false
            if card.cardName == .bang {
                card.play()
                played = card.play()
            } else {
                played = card.play()
            }
            Game.shared.playedDeck.append(card)
            return played
        } else {
            return super.UseCard(index: index, expectedPlayableCardTypes: expectedPlayableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
        }
    }
}
