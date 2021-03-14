//
//  DrawableCard.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 14..
//

import Foundation

protocol DrawableCard {
    var cardSuit: CardSuit { get }
    var cardNumber: CardNumber { get }
    var cardType: CardType { get }
}
