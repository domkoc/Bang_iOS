//
//  Weapon.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

/// Represents a drawable weapon type card
protocol WeaponCard: DrawableCard {
    var weaponType: WeaponType { get }
    var cardType: CardType { get }
}

/// Extends WeaponCard with card type identification
extension WeaponCard {
    var cardType: CardType {
        get {
            return CardType.weapon
        }
    }
}
