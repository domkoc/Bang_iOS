//
//  CharacterName.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 14..
//

import Foundation

/// Represents all available characters
enum CharacterName: String {
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
            }
        }
}
