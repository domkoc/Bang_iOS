//
//  BartCassidyCharacter.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation

class BartCassidyCharacter: Character {
    var name: CharacterType = .bartCassidy
    
    var maxLifeCount: Int = 4
    
    var weapon: WeaponCard = WeaponCard(cardSuit: .Spades, cardNumber: .Ace, weaponType: .colt)
    
    var life: Int = 4
    
    var hand: [DrawableCard] = []
    
    var equippedPowers: [PowerCard] = []
    
    
}
