//
//  Character.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

class Character {
    
    let name: CharacterType
    let maxLifeCount: Int
    var weapon: WeaponCard
    var life: Int
    var hand: [DrawableCard] = []
    var equippedPowers: [PowerCard] = []
    
    init(name: CharacterType = .none, maxLifeCount: Int = 5) throws {
        self.name = name
        self.maxLifeCount = maxLifeCount
        self.weapon = WeaponCard(cardSuit: .Spades, cardNumber: .Ace, weaponType: .colt)
        self.life = self.maxLifeCount
        if name == .none {
            throw RuntimeError.error(name.characterDescription)
        }
    }
    
    func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        switch hand[index].cardType {
        case .playable:
            let card = hand[index] as! PlayableCard
            if expectedPlayableCardTypes.contains(card.cardName) {
                let currentCard = hand.remove(at: index)
                Game.shared.playedDeck.append(currentCard)
                return currentCard.play()
            }
        case .power:
            let card = hand[index] as! PowerCard
            if expectedPowerCardTypes.contains(card.powerType) {
                let currentCard = hand.remove(at: index)
                Game.shared.playedDeck.append(currentCard)
                return currentCard.play()
            }
        case .weapon:
            let card = hand[index] as! WeaponCard
            if expectedWeaponCardTypes.contains(card.weaponType) {
                let currentCard = hand.remove(at: index)
                Game.shared.playedDeck.append(currentCard)
                return currentCard.play()
            }
        }
        return false
    }
    
    func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        var newCards: [DrawableCard] = []
        for _ in 0..<n {
            if keep{
                if hand.count < life {
                    let card = Game.shared.drawDeck.popLast()!
                    hand.append(card)
                    newCards.append(card)
                }
            } else if toPlayed {
                let card = Game.shared.drawDeck.popLast()!
                Game.shared.playedDeck.append(card)
                newCards.append(card)
            } else {
                newCards.append(Game.shared.drawDeck.popLast()!)
            }
        }
        return newCards
    }
    
    func takeLife() {
        life -= 1 // TODO: nem talált megnézése
    }
    
    func gainLife() {
        if life < maxLifeCount {
            life += 1
        }
    }
    
    func takeCard(type: CardType, index: Int) -> DrawableCard? {
        var tempCard: DrawableCard? = nil
        switch type {
        case .playable:
            if index > hand.count {
                print("Nagy szar van a Character takeCard-ban")
            } else {
                tempCard = hand.remove(at: index)
            }
        case .power:
            if index > equippedPowers.count {
                print("Nagy szar van a Character takeCard-ban")
            } else {
                tempCard = equippedPowers.remove(at: index)
            }
        case .weapon:
            tempCard = weapon
            weapon = WeaponCard(cardSuit: .Clubs, cardNumber: .two, weaponType: .colt)
        }
        return tempCard
    }
    
    func calculateDistanceFrom(selfIndex: Int, targetIndex: Int) -> Int {
        let players = Game.shared.players
        let pos1 = selfIndex
        let pos2 = players.count + selfIndex
        let pos3 = -1*(players.count - selfIndex)
        
        let distance1 = targetIndex < pos1 ? pos1 - targetIndex : targetIndex - pos1
        let distance2 = targetIndex < pos2 ? pos2 - targetIndex : targetIndex - pos2
        let distance3 = targetIndex < pos3 ? pos3 - targetIndex : targetIndex - pos3
        
        var distance = distance1 < distance2 ? distance1 : distance2
        distance = distance < distance3 ? distance : distance3
        return distance + players[targetIndex].character.defaultDistance() - players[selfIndex].character.minusDistance()
    }
    
    func defaultDistance() -> Int {
        return 0
    }
    
    func minusDistance() -> Int {
        return 0
    }
    
    func usePower() -> Bool {
        return false
    }
}
