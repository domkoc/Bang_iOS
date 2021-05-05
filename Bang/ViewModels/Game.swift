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
    var currentTargetCardIndex: Int?
    var currentPlayer: Player?
    var selectedCard: DrawableCard?
    var selectedCardType: CardType?
    
    init() {
        playedDeck = [DrawableCard]()
        drawDeck = [DrawableCard]()
        players = [Player]()
        fillDeck()
        do {
            addPlayer(player: Player(character: try CalamityJanetCharacter()))
            addPlayer(player: Player(character: try BlackJackCharacter()))
            addPlayer(player: Player(character: try KitCarlsonCharacter()))
        } catch RuntimeError.error(let error) {
            print(error)
            currentPlayer = nil
        } catch {
            print("Unhandled init error in character.")
            currentPlayer = nil
        }
    }
    
    mutating func addPlayer(player: Player) {
        player.fillHand(cardsDeck: &drawDeck)
        players.insert(player, at: 0)
        currentPlayer = players[0]
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
    
    mutating func simulateRound() -> DrawableCard {
        var lastCard: DrawableCard?
        for i in 1..<players.count {
            currentPlayer = players[i]
            let card = players[i].character.hand.first!
            switch card.cardSheetType {
            case .player:
                currentTarget = players.first
            case .none:
                break
            case .card:
                selectedCard = drawDeck.removeFirst()
            case .playerCard:
                currentTarget = players.first
                selectedCard = currentTarget?.character.takeCard(type: .playable, index: 0)
            }
            lastCard = players[i].character.hand.first! as DrawableCard
            playedDeck.append(players[i].character.hand.removeFirst())
            for player in players {
                player.character.drawCard(n: 2)
            }
        }
        return lastCard!
    }
    
    mutating func fillDeck(advanced: Bool = false) {
        //Bang cards:
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .two, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .two, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .three, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .three, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .four, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .four, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .five, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .five, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .six, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .six, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .seven, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .seven, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .eight, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .eight, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Clubs, cardNumber: .nine, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .nine, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .ten, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Ace, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Ace, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Spades, cardNumber: .Ace, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Jack, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .King, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .King, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Diamonds, cardNumber: .Queen, cardName: .bang, cardSheetType: .player))
        drawDeck.append(BangCard(cardSuit: .Hearths, cardNumber: .Queen, cardName: .bang, cardSheetType: .player))
        
        //Beer cards:
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .six, cardName: .beer, cardSheetType: nil))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .seven, cardName: .beer, cardSheetType: nil))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .eight, cardName: .beer, cardSheetType: nil))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .nine, cardName: .beer, cardSheetType: nil))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .ten, cardName: .beer, cardSheetType: nil))
        drawDeck.append(BeerCard(cardSuit: .Hearths, cardNumber: .Jack, cardName: .beer, cardSheetType: nil))
        
        //Cat Balou cards:
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .nine, cardName: .catBalou, cardSheetType: .playerCard))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .ten, cardName: .catBalou, cardSheetType: .playerCard))
        drawDeck.append(CatBalouCard(cardSuit: .Diamonds, cardNumber: .Jack, cardName: .catBalou, cardSheetType: .playerCard))
        drawDeck.append(CatBalouCard(cardSuit: .Hearths, cardNumber: .King, cardName: .catBalou, cardSheetType: .playerCard))
        
        //Gatling card:
        drawDeck.append(GatlingCard(cardSuit: .Hearths, cardNumber: .ten, cardName: .gatling, cardSheetType: nil))
        
        //Missed cards:
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .two, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .three, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .four, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .five, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .six, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .seven, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Spades, cardNumber: .eight, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .ten, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Ace, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Jack, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .King, cardName: .missed, cardSheetType: nil))
        drawDeck.append(MissedCard(cardSuit: .Clubs, cardNumber: .Queen, cardName: .missed, cardSheetType: nil))
        
        //Panic cards:
        drawDeck.append(PanicCard(cardSuit: .Diamonds, cardNumber: .eight, cardName: .panic, cardSheetType: .playerCard))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Ace, cardName: .panic, cardSheetType: .playerCard))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Jack, cardName: .panic, cardSheetType: .playerCard))
        drawDeck.append(PanicCard(cardSuit: .Hearths, cardNumber: .Queen, cardName: .panic, cardSheetType: .playerCard))
        
        //Saloon card:
        drawDeck.append(SaloonCard(cardSuit: .Hearths, cardNumber: .five, cardName: .saloon, cardSheetType: nil))
        
        //Stage Coach cards:
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine, cardName: .stageCoach, cardSheetType: nil))
        drawDeck.append(StageCoachCard(cardSuit: .Spades, cardNumber: .nine, cardName: .stageCoach, cardSheetType: nil))
        
        //Wells Fargo card:
        drawDeck.append(WellsFargoCard(cardSuit: .Hearths, cardNumber: .three, cardName: .wellsFargo, cardSheetType: nil))
        drawDeck.shuffle()
    }
    
    func allCharactersList() -> [Character] {
        var list: [Character] = []
        do {
            list.append(try BartCassidyCharacter())
            list.append(try JourdonnaisCharacter())
            list.append(try JesseJonesCharacter())
            list.append(try SlabTheKillerCharacter())
            list.append(try PedroRamirezCharacter())
            list.append(try VultureSamCharacter())
            list.append(try WillyTheKidCharacter())
            list.append(try RoseDoolanCharacter())
            list.append(try SuzyLafayetteCharacter())
            list.append(try SidKetchumCharacter())
            list.append(try ElGringoCharacter())
            list.append(try LuckyDukeCharacter())
            list.append(try PaulRegretCharacter())
            list.append(try KitCarlsonCharacter())
            list.append(try BlackJackCharacter())
            list.append(try CalamityJanetCharacter())
        } catch {
            print("Error creating characters list!")
        }
        return list
    }
}
