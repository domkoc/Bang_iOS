//
//  Character.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

protocol Character {
    var name: CharacterName { get }
    var maxLifeCount: Int { get }
    var weapon: WeaponCard { get set }
    var life: Int { get set }
    var sight: Int { get set }
}

extension Character {
    func DrawCard(cardsDeck: inout [DrawableCard]) -> DrawableCard {
        return cardsDeck.popLast()!
    }
}
