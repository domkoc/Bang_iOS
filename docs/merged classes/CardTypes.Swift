/// Represents a card that is drawable from the deck at any time during the game.
protocol DrawableCard {
    
    /// The suit of the card
    var cardSuit: CardSuit { get }
    
    /// The number or character on the card
    var cardNumber: CardNumber { get }
    
    /// The type of the card
    var cardType: CardType { get }
    
    /// The type of the card
    var cardImageName: String { get }
    
    var cardSheetType: sheetType? { get }
    
    func play() -> Bool
}

/// Represents a drawable weapon type card
class WeaponCard: DrawableCard {
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let weaponType: WeaponType
    let cardType: CardType = CardType.weapon
    var cardImageName: String = "backCard"
    let cardSheetType: sheetType? = nil
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, weaponType: WeaponType) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.weaponType = weaponType
    }
    
    func play() -> Bool {
        return false
    }
}

/// Represents a drawable power type card
class PowerCard: DrawableCard {
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let powerType: PowerType
    let cardType: CardType = CardType.power
    var cardImageName: String = "backCard"
    let cardSheetType: sheetType? = nil
    
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, powerType: PowerType) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.powerType = powerType
    }
    
    func play() -> Bool {
        return false
    }
}

/// Represents a drawable weapon type card
class PlayableCard: DrawableCard, Equatable {
    static func == (lhs: PlayableCard, rhs: PlayableCard) -> Bool {
        return lhs.cardImageName == rhs.cardImageName
    }
    
    
    
    let cardSuit: CardSuit
    let cardNumber: CardNumber
    let cardType: CardType = CardType.playable
    var cardImageName: String = "backCard"
    let cardName: PlayableType
    let cardSheetType: sheetType?
    
    init(cardSuit: CardSuit, cardNumber: CardNumber, cardName: PlayableType, cardSheetType: sheetType? = nil) {
        self.cardSuit = cardSuit
        self.cardNumber = cardNumber
        self.cardName = cardName
        self.cardSheetType = cardSheetType
    }
    
    func play() -> Bool {
        return false
    }
}
