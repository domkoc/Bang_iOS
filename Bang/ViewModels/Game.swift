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
        players = [Player]() // TODO: Init players
        currentPlayer = Player(character: BartCassidyCharacter())//players[0]
        fillDeck()
        currentPlayer.fillHand(cardsDeck: &drawDeck)
    }
    
    
    
    mutating func reFillDeck() {
        let top1 = playedDeck.popLast()!
        let top2 = playedDeck.popLast()!
        let top3 = playedDeck.popLast()!
        drawDeck.append(contentsOf: playedDeck)
        drawDeck.shuffle()
        playedDeck.removeAll()
        playedDeck.append(top3)
        playedDeck.append(top2)
        playedDeck.append(top1)
    }
    
    mutating func selectTarget() {
        currentTarget = players[0]
        // TODO: Init players
    }
    
    mutating func fillDeck(advanced: Bool = false) {
        //Bang cards:
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .two))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .two))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .three))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .three))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .four))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .four))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .five))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .five))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .six))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .six))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .seven))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .seven))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .eight))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .eight))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .nine))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .nine))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .ten))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Ace))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Ace))
        drawDeck.append(BangCard(cardSuit: .Spades, cardNumber: .Ace))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Jack))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .King))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .King))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Queen))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Queen))
        
        //Beer cards:
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .six))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .seven))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .eight))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .nine))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .ten))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .Jack))
        
        //Cat Balou cards:
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .nine))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .ten))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .Jack))
        drawDeck.append(CatBalouCard(cardSuit: .Hearths, cardNumber: .King))
        
        //Gatling card:
        drawDeck.append(GatlingCard(cardSuit: .Hearths, cardNumber: .ten))
        
        //Missed cards:
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .two))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .three))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .four))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .five))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .six))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .seven))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .eight))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .ten))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Ace))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Jack))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .King))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Queen))
        
        //Panic cards:
        drawDeck.append(PanicCard(cardSuit: .Diamonds, cardNumber: .eight))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Ace))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Jack))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Queen))
        
        //Saloon card:
        drawDeck.append(SaloonCard(cardSuit: .Hearths, cardNumber: .five))
        
        //Panic cards:
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine))
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine))
        
        //Wells Fargo card:
        drawDeck.append(WellsFargoCard(cardSuit: .Hearths, cardNumber: .three))
    }
}
