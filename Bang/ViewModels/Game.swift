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
    var currentPlayer: Player?
    
    init() {
        playedDeck = [DrawableCard]()
        drawDeck = [DrawableCard]()
        players = [Player]() // TODO: Init players
        do {
            players.append(Player(character: try BartCassidyCharacter()))
            currentPlayer = players.first!  //players[0]
            fillDeck()
            currentPlayer!.fillHand(cardsDeck: &drawDeck)
        } catch RuntimeError.error(let error) {
            print(error) // TODO: Error handling
            currentPlayer = nil
        } catch {
            print("Unhandled init error in character.")
            currentPlayer = nil
        }
    }
    
    mutating func drawFromDeck() -> DrawableCard {
        if drawDeck.isEmpty {
            reFillDeck()
        }
        let card = drawDeck.popLast()!
        if drawDeck.isEmpty {
            reFillDeck()
        }
        return card
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
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .two, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .two, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .three, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .three, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .four, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .four, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .five, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .five, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .six, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .six, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .seven, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .seven, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .eight, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .eight, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .nine, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .nine, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .ten, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Ace, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Ace, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Spades, cardNumber: .Ace, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Jack, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .King, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .King, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Queen, cardName: .bang))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Queen, cardName: .bang))
        
        //Beer cards:
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .six, cardName: .beer))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .seven, cardName: .beer))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .eight, cardName: .beer))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .nine, cardName: .beer))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .ten, cardName: .beer))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .Jack, cardName: .beer))
        
        //Cat Balou cards:
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .nine, cardName: .catBalou))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .ten, cardName: .catBalou))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .Jack, cardName: .catBalou))
        drawDeck.append(CatBalouCard(cardSuit: .Hearths, cardNumber: .King, cardName: .catBalou))
        
        //Gatling card:
        drawDeck.append(GatlingCard(cardSuit: .Hearths, cardNumber: .ten, cardName: .gatling))
        
        //Missed cards:
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .two, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .three, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .four, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .five, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .six, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .seven, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .eight, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .ten, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Ace, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Jack, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .King, cardName: .missed))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Queen, cardName: .missed))
        
        //Panic cards:
        drawDeck.append(PanicCard(cardSuit: .Diamonds, cardNumber: .eight, cardName: .panic))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Ace, cardName: .panic))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Jack, cardName: .panic))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Queen, cardName: .panic))
        
        //Saloon card:
        drawDeck.append(SaloonCard(cardSuit: .Hearths, cardNumber: .five, cardName: .saloon))
        
        //Stage Coach cards:
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine, cardName: .stageCoach))
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine, cardName: .stageCoach))
        
        //Wells Fargo card:
        drawDeck.append(WellsFargoCard(cardSuit: .Hearths, cardNumber: .three, cardName: .wellsFargo))
    }
}
