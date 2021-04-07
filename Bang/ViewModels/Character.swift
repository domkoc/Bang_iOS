//
//  Character.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

protocol Character {
    var name: CharacterType { get }
    var maxLifeCount: Int { get }
    var weapon: WeaponCard { get set }
    var life: Int { get set }
    var hand: [DrawableCard] { get set }
    var equippedPowers: [PowerCard] { get set }
}

extension Character {
    mutating func drawCard(cardsDeck: inout [DrawableCard], n: Int = 1) {
        for _ in 0..<n {
            if hand.count < life {
                hand.append(cardsDeck.popLast()!)
            }
        }
    }
    mutating func takeLife() {
        life -= 1 // TODO: nem talált megnézése
    }
    mutating func gainLife() {
        if life < maxLifeCount {
            life += 1
        }
    }
    mutating func takeCard(type: CardType, index: Int) -> DrawableCard? {
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
}
