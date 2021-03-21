//
//  CardColor.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 14..
//

import Foundation

/// Represents the available types of cards
enum CardType {
    
    /// The orange cards, that are playable during a turn
    case playable
    
    /// An equipable weapon
    case weapon
    
    /// An equipable power
    case power
    
    /// Represents that the card is equipable for players or not
    var isEquipable: Bool {
        switch self {
        case .playable:
            return false
        case .power, .weapon:
            return true
        }
    }
    
}
