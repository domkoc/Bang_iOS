//
//  Player.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

class Player {
    
    public var character: Character
    public var isInPlay: Bool
    init(character: Character) {
        self.character = character
        isInPlay = true
        
    }
    
    func fillHand(cardsDeck: inout [DrawableCard]) {
        for _ in character.hand.count..<character.life {
            self.character.hand.append(cardsDeck.popLast()!)
        }
    }
}

extension Player: Equatable, Hashable, Identifiable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.character.name == rhs.character.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(character.name)
    }
}
