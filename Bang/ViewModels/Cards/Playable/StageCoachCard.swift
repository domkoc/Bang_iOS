//
//  StageCoachCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 07..
//

import Foundation
import SwiftUI

class StageCoachCard: PlayableCard {
    
    override func play() -> Bool {
        Game.shared.currentPlayer!.character.drawCard(n: 2)
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownStageCoach_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
