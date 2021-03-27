//
//  Character.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

protocol Character {
    var name: CharacterType { get }
    var maxLifeCount: Int { get }
    var weapon: WeaponCard { get set }
    var life: Int { get set }
    var sight: Int { get set }
    var hand: [DrawableCard] { get set }
    var equippedPowers: [PowerCard] { get set }
}

extension Character {
    mutating func drawCard(cardsDeck: inout [DrawableCard]) {
        hand.append(cardsDeck.popLast()!)
    }
    mutating func takeLife() {
        life -= 1 // TODO: nem talált megnézése
    }
    mutating func gainLife() {
        if life < maxLifeCount {
            life += 1
        }
    }
    mutating func takeCard(type: CardType, index: Int) -> DrawableCard? {
        var tempCard: DrawableCard? = nil
        switch type {
        case .playable:
            if index > hand.count {
                print("Nagy szar van a Character takeCard-ban")
            } else {
                tempCard = hand.remove(at: index)
            }
        case .power:
            if index > equippedPowers.count {
                print("Nagy szar van a Character takeCard-ban")
            } else {
                tempCard = equippedPowers.remove(at: index)
            }
        case .weapon:
            tempCard = weapon
            weapon = WeaponCard(cardSuit: .Clubs, cardNumber: .two, weaponType: .colt)
        }
        return tempCard
    }
}
