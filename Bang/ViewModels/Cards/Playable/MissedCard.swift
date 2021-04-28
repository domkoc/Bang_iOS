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
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownMissed_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
