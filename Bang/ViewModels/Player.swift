//
//  Player.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

class Player {
    public var character: Character
    init(character: Character, cardsDeck: inout [DrawableCard]) {
        self.character = character
        for _ in 0..<5 {
            self.character.drawCard(cardsDeck: &cardsDeck)
        }
    }
}
