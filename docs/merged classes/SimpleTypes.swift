//
//  Game.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation
import SwiftUI


enum CardSuit: String {
    
    /// The hearths suit
    case Hearths = "H"
    
    /// The diamonds suit
    case Diamonds = "D"
    
    /// The clubs suit
    case Clubs = "C"
    
    /// The spades suit
    case Spades = "S"
}

enum CardNumber: String {
    
    /// Two
    case two = "2"
    
    // Three
    case three = "3"
    
    /// Four
    case four = "4"
    
    /// Five
    case five = "5"
    
    /// Six
    case six = "6"
    
    /// Seven
    case seven = "7"
    
    /// Eight
    case eight = "8"
    
    /// Nine
    case nine = "9"
    
    /// Ten
    case ten = "10"
    
    /// Jack
    case Jack = "J"
    
    /// Queen
    case Queen = "Q"
    
    /// King
    case King = "K"
    
    /// Ace
    case Ace = "A"
}

/// Represents the available types of cards
enum CardType {
    
    /// The orange cards, that are playable during a turn
    case playable
    
    /// An equipable weapon
    case weapon
    
    /// An equipable power
    case power
    
    /// Represents that the card is equipable for players or not
    var isEquipable: Bool {
        switch self {
        case .playable:
            return false
        case .power, .weapon:
            return true
        }
    }
    
}

enum sheetType {
    case player
    case card
    case playerCard
}

/// Represents all available characters
enum CharacterType: String {
    case bartCassidy = "Bart Cassidy"
    case kitCarlson = "Kit Carlson"
    case slabTheKiller = "Slab the Killer"
    case blackJack = "Black Jack"
    case luckyDuke = "Lucky Duke"
    case suzyLafayette = "Suzy Lafayette"
    case calamityJanet = "Calamity Janet"
    case paulRegret = "Paul Regret"
    case vultureSam = "Vulture Sam"
    case elGringo = "El Gringo"
    case pedroRamirez = "Pedro Ramirez"
    case willyTheKid = "Willy the Kid"
    case jesseJones = "Jesse Jones"
    case roseDoolan = "Rose Doo lan"
    case jourdonnais = "Jourdonnais"
    case sidKetchum = "Sid Ketchum"
    case none = "error"
    
    var characterDescription: String {
            switch self {
            case .bartCassidy:
                return ("Valahányszor eltalálják, húz egy lapot.")
            case .kitCarlson:
                return ("Amikor lapot húz, megnézi a felső három lapot a húzópakliból, és kiválaszt közülük kettőt.")
            case .slabTheKiller:
                return ("Ha BANG! kártyával rálő egy játékosra, az csak két Nem talált! lappal tud kitérni.")
            case .blackJack:
                return ("Ha húz, mindig megmutatja a második lapot. Ha az kör vagy káró, húz még egy lapot.")
            case .luckyDuke:
                return ("Valahányszor lapot kell húznia, felfordítja a felső két lapot, és választ egyet.")
            case .suzyLafayette:
                return ("Ha nem marad lap a kezében, húz egyet.")
            case .calamityJanet:
                return ("Kijátszhat BANG! kártyát Nem talált!-ként és fordítva.")
            case .paulRegret:
                return ("A többi játékos 1-gyel messzebbről látja.")
            case .vultureSam:
                return ("Valahányszor egy játékos kiesik a játékból, megkapja a lelőtt játékos megmaradt lapjait.")
            case .elGringo:
                return ("Valahányszor eltalálják, húz egy lapot annak a játékosnak a kezéből, aki eltalálta.")
            case .pedroRamirez:
                return ("Az első lapját a dobott lapok pakli tetejéről is húzhatja.")
            case .willyTheKid:
                return ("Akárhány BANG! kártyát kijátszhat.")
            case .jesseJones:
                return ("Az első lapot húzhatja egy másik játékos kezéből.")
            case .roseDoolan:
                return ("1-gyel közelebről látja a többi játékost.")
            case .jourdonnais:
                return ("Valahányszor rálőnek BANG! kártyával, húzhat egy lapot. Ha kőrt húz, a lövés nem talált.")
            case .sidKetchum:
                return ("Ha eldob két lapot, visszanyer 1 életpontot.")
            case .none:
                return ("Nem sikerült a karakter inicializálása")
            }
        }
}


/// Represents all available weapon types
enum WeaponType: String {
    case colt = "Colt .45"
    case carabine = "Karabély"
    case rapidFire = "Gyorstüzelő"
    case remington = "Remington"
    case schofield = "Schofield"
    case winchester = "Winchester"
    
    /// The firepower of the weapon
    var firePower: Int {
            switch self {
            case .colt:
                return 1
            case .carabine:
                return 4
            case .rapidFire:
                return 1
            case .remington:
                return 3
            case .schofield:
                return 2
            case .winchester:
                return 5
            }
        }
}

/// Represents all available power types
enum PowerType: String {
    case barrel = "Hordó"
    case dinamite = "Dinamit"
    case jail = "Börtön"
    case mustang = "Musztáng"
    case scope = "Távcső"
}

enum PlayableType: String {
    case bang = "Bang!"
    case beer = "Sör"
    case catBalou = "Cat Balou"
    case saloon = "Kocsma"
    case stageCoach = "Postakocsi"
    case wellsFargo = "Wells Fargo"
    case panic = "Pánik"
    case gatling = "Gatling"
    case missed = "Nem Talált"
}


