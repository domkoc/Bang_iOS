
class MissedCard: PlayableCard {
    
    
    override func play() -> Bool {
        return false
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownMissed_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class GatlingCard: PlayableCard {
    
    
    override func play() -> Bool {
        for player in Game.shared.players {
            player.character.takeLife()
        }
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownGatling_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class PanicCard: PlayableCard {
    override func play() -> Bool {
        let target = Game.shared.currentTarget!
        let player = Game.shared.currentPlayer
        let distance = player!.character.calculateDistanceFrom(selfIndex: Game.shared.players.firstIndex(of: player!)!,
                                                              targetIndex: Game.shared.players.firstIndex(of: target)!)
        if  distance > 1{
            return false
        } else {
            let card: DrawableCard = target.character.takeCard(type: Game.shared.selectedCardType!, index: Game.shared.currentTargetCardIndex!)!
            Game.shared.currentPlayer!.character.hand.append(card)
            return true
        }
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownPanic_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class WellsFargoCard: PlayableCard {
    override func play() -> Bool {
        Game.shared.currentPlayer!.character.drawCard(n: 3)
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownWellsFargo_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class StageCoachCard: PlayableCard {
    
    override func play() -> Bool {
        Game.shared.currentPlayer!.character.drawCard(n: 2)
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownStageCoach_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class SaloonCard: PlayableCard {
    override func play() -> Bool {
        for player in Game.shared.players {
            player.character.gainLife()
        }
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownSaloon_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class CatBalouCard: PlayableCard {
    override func play() -> Bool {
        let target = Game.shared.currentTarget!
        let card = target.character.takeCard(type: Game.shared.selectedCardType!, index: Game.shared.currentTargetCardIndex!)
        Game.shared.currentPlayer?.character.addCard(card: card!)
        return true
    }
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownCatBalou_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class BeerCard: PlayableCard {
    override func play() -> Bool {
        Game.shared.currentPlayer!.character.gainLife()
        return true
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownBeer_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}

class BangCard: PlayableCard {
    
    override func play() -> Bool {
        let target = Game.shared.currentTarget!
        let player = Game.shared.currentPlayer
        let distance = player!.character.calculateDistanceFrom(selfIndex: Game.shared.players.firstIndex(of: player!)!,
                                                              targetIndex: Game.shared.players.firstIndex(of: target)!)
        if  distance > player!.character.weapon.weaponType.firePower{
            return false
        } else {
            target.character.takeLife()
            return true
        }
    }
    
    override init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType?) {
        super.init(cardSuit: cardSuit, cardNumber: cardNumber, cardName: cardName, cardSheetType: cardSheetType)
        var bangImgeText = "brownBang_"
        bangImgeText.append(cardNumber.rawValue)
        bangImgeText.append(cardSuit.rawValue.first!)
        cardImageName = bangImgeText
    }
}
