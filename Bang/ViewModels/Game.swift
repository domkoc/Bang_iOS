//
//  Game.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

struct Game {
    static var shared = Game()
    
    var drawDeck: [DrawableCard]
    var playedDeck: [DrawableCard]
    var players: [Player]
    var currentTarget: Player?
    var currentPlayer: Player
    
    init() {
        playedDeck = [DrawableCard]()
        drawDeck = [DrawableCard]()
        players = [Player]()
        // TODO: Init players
        currentPlayer = players[0]
    }
    
    mutating func selectTarget() {
        currentTarget = players[0]
        // TODO: Init players
    }
}
