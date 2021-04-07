//
//  Player.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

class Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.character.name == rhs.character.name
    }
    
    public var character: Character
    public var isInPlay: Bool
    init(character: Character) {
        self.character = character
        isInPlay = true
        
    }
    
    func fillHand(cardsDeck: inout [DrawableCard]) {
        for _ in 0..<5 {
            self.character.drawCard(cardsDeck: &cardsDeck)
        }
    }
}
