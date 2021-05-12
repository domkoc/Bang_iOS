class CalamityJanetCharacter: Character {
    
    override init(name: CharacterType = .calamityJanet, maxLifeCount: Int = 4, cardImageName: String = "charaCalamityJanet") throws {
        try super.init(name: .calamityJanet, maxLifeCount: 4, cardImageName: "charaCalamityJanet")
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        var playableCardTypes = expectedPlayableCardTypes
        if !playableCardTypes.contains(.bang) && playableCardTypes.contains(.missed) {
            playableCardTypes.append(.bang)
        }
        if !playableCardTypes.contains(.missed) && playableCardTypes.contains(.bang) {
            playableCardTypes.append(.missed)
        }
        return super.UseCard(index: index, expectedPlayableCardTypes: playableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
    }
    
    
}

class BlackJackCharacter: Character {
    
    override init(name: CharacterType = .blackJack, maxLifeCount: Int = 4, cardImageName: String = "charaBlackJack") throws {
        try super.init(name: .bartCassidy, maxLifeCount: 4, cardImageName: "charaBlackJack")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        var newCards = super.drawCard(n: n)
        if  newCards.count >= 2{
            if newCards[1].cardSuit == .Hearths || newCards[1].cardSuit == .Diamonds {
                newCards.append(contentsOf: super.drawCard())
            }
        }
        return newCards
    }
}


class KitCarlsonCharacter: Character {
    
    override init(name: CharacterType = .kitCarlson, maxLifeCount: Int = 4, cardImageName: String = "charaKitCarlson") throws {
        try super.init(name: .kitCarlson, maxLifeCount: 4, cardImageName: "charaKitCarlson")
    }

    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 2 {
            var cards: [DrawableCard] = []
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            cards.append(contentsOf: super.drawCard(keep: false, toPlayed: false))
            Game.shared.drawDeck.append(cards.remove(at: 0))
            hand.append(cards[0])
            hand.append(cards[1])
            return cards
        } else {
            return super.drawCard(n: n, keep: keep)
        }
    }
}


class PaulRegretCharacter: Character {
    
    override init(name: CharacterType = .paulRegret, maxLifeCount: Int = 3, cardImageName: String = "charaPaulRegret") throws {
        try super.init(name: .paulRegret, maxLifeCount: 3, cardImageName: "charaPaulRegret")
    }
    
    override func defaultDistance() -> Int {
        return 1
    }
}

class LuckyDukeCharacter: Character {
    
    override init(name: CharacterType = .luckyDuke, maxLifeCount: Int = 4, cardImageName: String = "charaLuckyDuke") throws {
        try super.init(name: .luckyDuke, maxLifeCount: 4, cardImageName: "charaLuckyDuke")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 1 && keep == false{
            var cards: [DrawableCard] = []
            cards.append(contentsOf: super.drawCard(n: 2, keep: false))
            return cards
        } else {
            return super.drawCard(n: n, keep: keep)
        }
    }
}

class ElGringoCharacter: Character {
    
    override init(name: CharacterType = .elGringo, maxLifeCount: Int = 3, cardImageName: String = "charaElGringo") throws {
        try super.init(name: .elGringo, maxLifeCount: 3, cardImageName: "charaElGringo")
    }
    
    override func takeLife() {
        super.takeLife()
        drawCard()
    }
}

class SidKetchumCharacter: Character {
    override init(name: CharacterType = .sidKetchum, maxLifeCount: Int = 4, cardImageName: String = "charaSidKetchum") throws {
        try super.init(name: .sidKetchum, maxLifeCount: 4, cardImageName: "charaSidKetchum")
    }
    
    override func usePower() -> Bool {
        if hand.count >= 2 {
            Game.shared.playedDeck.append(hand.remove(at: 0))
            Game.shared.playedDeck.append(hand.remove(at: 0))
            gainLife()
            return true
        } else {
            return false
        }
    }
}

class SuzyLafayetteCharacter: Character {
    override init(name: CharacterType = .suzyLafayette, maxLifeCount: Int = 4, cardImageName: String = "charaSuzyLafayette") throws {
        try super.init(name: .suzyLafayette, maxLifeCount: 4, cardImageName: "charaSuzyLafayette")
    }
    
    override func takeCard(type: CardType, index: Int) -> DrawableCard? {
        let returnvalue = super.takeCard(type: type, index: index)
        if hand.isEmpty {
            drawCard()
        }
        return returnvalue
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        let returnvalue = super.UseCard(index: index, expectedPlayableCardTypes: expectedPlayableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
        if hand.isEmpty {
            drawCard()
        }
        return returnvalue
    }
}

class RoseDoolanCharacter: Character {
    override init(name: CharacterType = .roseDoolan, maxLifeCount: Int = 4, cardImageName: String = "charaRoseDoolan") throws {
        try super.init(name: .roseDoolan, maxLifeCount: 4, cardImageName: "charaRoseDoolan")
        }
    
    override func minusDistance() -> Int {
        return 1
    }
}

class WillyTheKidCharacter: Character {
    override init(name: CharacterType = .willyTheKid, maxLifeCount: Int = 4, cardImageName: String = "charaWillyTheKid") throws {
        try super.init(name: .willyTheKid, maxLifeCount: 4, cardImageName: "charaWillyTheKid")
    }
}

class VultureSamCharacter: Character {
    override init(name: CharacterType = .vultureSam, maxLifeCount: Int = 4, cardImageName: String = "charaVultureSam") throws {
        try super.init(name: .vultureSam, maxLifeCount: 4, cardImageName: "charaVultureSam")
    }
}

class PedroRamirezCharacter: Character {
    override init(name: CharacterType = .pedroRamirez, maxLifeCount: Int = 4, cardImageName: String = "charaPedroRamirez") throws {
        try super.init(name: .pedroRamirez, maxLifeCount: 4, cardImageName: "charaPedroRamirez")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        if n == 2 && keep{
            var cards: [DrawableCard] = []
            cards.append(contentsOf: drawCard(keep: keep, toPlayed: toPlayed))
            cards.append(contentsOf: drawCard(keep: keep, toPlayed: toPlayed))
            return cards
        } else {
            return super.drawCard(n: n, keep: keep, toPlayed: toPlayed)
        }
    }
}

class SlabTheKillerCharacter: Character {
    override init(name: CharacterType = .slabTheKiller, maxLifeCount: Int = 4, cardImageName: String = "charaSlabTheKiller") throws {
        try super.init(name: .slabTheKiller, maxLifeCount: 4, cardImageName: "charaSlabTheKiller")
    }
    
    override func UseCard(index: Int, expectedPlayableCardTypes: [PlayableType] = [], expectedWeaponCardTypes: [WeaponType] = [], expectedPowerCardTypes: [PowerType] = []) -> Bool {
        if hand[index].cardType == .playable {
            let card = hand.remove(at: index) as! PlayableCard
            var played = false
            if card.cardName == .bang {
                card.play()
                played = card.play()
            } else {
                played = card.play()
            }
            Game.shared.playedDeck.append(card)
            return played
        } else {
            return super.UseCard(index: index, expectedPlayableCardTypes: expectedPlayableCardTypes, expectedWeaponCardTypes: expectedWeaponCardTypes, expectedPowerCardTypes: expectedPowerCardTypes)
        }
    }
}

class JesseJonesCharacter: Character {
    
    override init(name: CharacterType = .jesseJones, maxLifeCount: Int = 4, cardImageName: String = "charaJesseJones") throws {
        try super.init(name: .jesseJones, maxLifeCount: 4, cardImageName: "charaJesseJones")
    }
    
    override func drawCard(n: Int = 1, keep: Bool = true, toPlayed: Bool = true) -> [DrawableCard] {
        var drawnCards: [DrawableCard] = []
        if n == 2 {
            drawnCards.append(contentsOf: drawCard())
            drawnCards.append(contentsOf: drawCard())
            
        }
        else {
            drawnCards.append(contentsOf: drawCard(n: n))
        }
        return drawnCards
    }
    
}

class JourdonnaisCharacter: Character {
    
    override init(name: CharacterType = .jourdonnais, maxLifeCount: Int = 4, cardImageName: String = "charaJourdonnais") throws {
        try super.init(name: .jourdonnais, maxLifeCount: 4, cardImageName: "charaJourdonnais")
    }
    
    override func takeLife() {
        let card = drawCard(keep: false).first
        if !(card!.cardSuit == .Hearths) {
            super.takeLife()
        }
    }
}

class BartCassidyCharacter: Character {
    
    override init(name: CharacterType = .bartCassidy, maxLifeCount: Int = 4, cardImageName: String = "charaBartCassidy") throws {
        try super.init(name: .bartCassidy, maxLifeCount: 4, cardImageName: "charaBartCassidy")
    }
    
    override func takeLife() {
        super.takeLife()
        drawCard()
    }
    
}

