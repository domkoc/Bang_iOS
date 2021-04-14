//
//  WeaponCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 26..
//

import Foundation
import SwiftUI

/// Represents a drawable weapon type card
class WeaponCard: DrawableCard {
    
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let weaponType: WeaponType
    let cardType: CardType = CardType.weapon
    var cardImage: Image = Image("backCard")
    
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, weaponType: WeaponType) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.weaponType = weaponType
    }
    
    func play() -> Bool {
        return false
    }
}
