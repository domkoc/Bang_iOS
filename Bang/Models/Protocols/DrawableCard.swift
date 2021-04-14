//
//  DrawableCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 14..
//

import Foundation
import SwiftUI

/// Represents a card that is drawable from the deck at any time during the game.
protocol DrawableCard/*: Identifiable*/ {
    
    /// The suit of the card
    var cardSuit: CardSuit { get }
    
    /// The number or character on the card
    var cardNumber: CardNumber { get }
    
    /// The type of the card
    var cardType: CardType { get }
    
    /// The type of the card
    var cardImage: Image { get }
    
    func play() -> Bool
}
