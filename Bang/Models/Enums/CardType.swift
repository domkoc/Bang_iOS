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
    
    /// Represents the cards, that are equipable for a player
    enum equipable {
        
        /// An equipable weapon
        case weapon
        
        /// An equipable power
        case power
    }
}
