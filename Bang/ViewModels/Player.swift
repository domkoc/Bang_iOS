//
//  Player.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

class Player {
    var character: Character
    var hand: [DrawableCard] = []
    init(character: Character, cardsDeck: inout [DrawableCard]) {
        self.character = character
        for _ in 0..<5 {
            drawCard(cardsDeck: &cardsDeck)
        }
    }
    
    func drawCard(cardsDeck: inout [DrawableCard]) {
        hand.append(character.DrawCard(cardsDeck: &cardsDeck))
    }
}
