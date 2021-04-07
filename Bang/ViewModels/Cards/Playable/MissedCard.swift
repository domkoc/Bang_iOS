//
//  MissedCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation
import SwiftUI

class MissedCard: PlayableCard {
    
    
    override func play() -> Bool {
        return false
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber)
        var bangImgeText = "brownMissed_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImage = Image(bangImgeText)
    }
}
