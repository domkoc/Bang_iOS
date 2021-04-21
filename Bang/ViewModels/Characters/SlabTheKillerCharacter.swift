//
//  SlabTheKillerCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 14..
//

import Foundation

class SlabTheKillerCharacter: Character {
    override init(name: CharacterType = .slabTheKiller, maxLifeCount: Int = 4, cardImageName: String = "charaSlabTheKiller") throws {
        try super.init(name: .slabTheKiller, maxLifeCount: 4, cardImageName: "charaSlabTheKiller")
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
