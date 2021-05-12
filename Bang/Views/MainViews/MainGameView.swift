//
//  GameScreen.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

struct MainGameView: View {
    
    internal init(selectedGameMode: Binding<GameMode>, previousGameMode: Binding<GameMode>, character: Character) {
        self._selectedGameMode = selectedGameMode
        self._previousGameMode = previousGameMode
        self.character = character
        Game.shared.addPlayer(player: Player(character: character))
    }
    
    @Binding var selectedGameMode: GameMode
    @Binding var previousGameMode: GameMode
    @State var equipped = [PowerCard]()
    @ObservedObject var game: Game = Game.shared
    @State var weapon: WeaponCard? = nil
    //@State var selectedTarget: Player? = Game.shared.currentTarget
    @State var selectedTargetCardIndex: Int? = 0
    @State var showingCardSelectorView: Bool = false
    @State var showingQuickHelpView: Bool = false
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var shownSelectorSheetType: sheetType = .card
    @State var selectedCard: DrawableCard? = nil
    @State var playedCard: DrawableCard? = nil
    @State var selectedCardType: CardType? = nil
    
    var character: Character
    
    var body: some View {
        GeometryReader { container in
            VStack {
                HStack {
                    Button(action: {
                        print("Pressed left pile")
                    }, label: {
                        ZStack {
                            if playedCard == nil {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            } else {
                                Image(playedCard!.cardImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                            VStack {
                                Spacer().frame(height: 8)
                                Text("#" + String(Game.shared.playedDeck.count))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 1)
                                Spacer()
                            }
                        }
                    })
                    Button(action: {
                            print("Pressed right pile")
                    }, label: {
                        ZStack {
                            Image("backCard")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                            VStack {
                                Spacer().frame(height: 8)
                                Text("#" + String(Game.shared.drawDeck.count))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 1)
                                Spacer()
                            }
                                
                        }
                    })
                }.frame(height: container.size.height / 3)
                HStack {
                    ForEach(0..<game.players.first!.character.hand.count, id: \.self) { i in
                        Button(action: {
                            game.currentPlayer = game.players.first
                            playedCard = game.players.first!.character.hand[i]
                            if game.players.first!.character.hand[i].cardSheetType == nil {
                                showingSheet = false
                                game.players.first!.character.hand[i].play()
                                Game.shared.playedDeck.append(game.players.first!.character.hand.remove(at: i))
                                playedCard = simulateRound()
                            } else {
                                self.selectedCard = game.players.first!.character.hand[i]
                                shownSelectorSheetType = game.players.first!.character.hand[i].cardSheetType!
                                showingSheet = true
                            }
                        })  {
                            Image(game.players.first!.character.hand[i].cardImageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("A kártya jelenleg nem játszható ki!"), message: nil, dismissButton: .default(Text("OK")))
                        }
                    }
                }.frame(height: container.size.height / 3)
                VStack {
                    HStack {
                        HStack{
                            ForEach(0..<game.players.first!.character.equippedPowers.count, id: \.self) { i in
                                Image(game.players.first!.character.equippedPowers[i].cardImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                        }.frame(height: 60)
                        .padding(Edge.Set.leading, 10)
                        Spacer()
                    }
                    HStack {
                        Button(action: {
                                print("Pressed tray")
                        }, label: {
                            ZStack {
                                Image("tray1")
                                    .resizable()
                                    .scaledToFit()
                                VStack {
                                    HStack{
                                        Spacer().frame(width: container.size.width/11 - 8)
                                        ForEach(0..<game.players.first!.character.life, id: \.self) { i in
                                        Image("bullet")
                                            .resizable()
                                            .scaledToFit()
                                        }.rotationEffect(.degrees(25))
                                        Spacer()
                                    }.frame(height: container.size.height / 30)
                                    HStack(spacing: 2) {
                                        Spacer().frame(width: container.size.width/11 - 8)
                                        Image(character.cardImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Image("backRole")
                                            .resizable()
                                            .scaledToFit()
                                        Image(weapon == nil ? "" : weapon!.cardImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Spacer().frame(width: container.size.width/11 - 8)
                                    }
                                }
                            }
                        }).frame(height: container.size.height / 5.5)
                        Spacer().frame(width: container.size.width / 6)
                        VStack {
                            HStack {
                                Button(action: {
                                    print("Pressed quick")
                                    showingQuickHelpView.toggle()
                                }) {
                                    Image(systemName: "questionmark.circle")
                                }.sheet(isPresented: $showingSheet, content: {
                                    QuickHelpView(isShowing: $showingQuickHelpView)
                                })
                                Spacer()
                                Button(action: {
                                    previousGameMode = .singlePlayer
                                    selectedGameMode = .rules
                                }) {
                                    Image(systemName: "info.circle")
                                }
                            }
                            Button(action: {
                                print("Pressed pow")
                            }) {
                                Text("pow")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .font(Font.custom("FortDeath", size: 40))
                            }
                            .background(Color.orange)
                            .clipShape(Circle())
                        }
                        .frame(width: 75)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                    }
                }
                .frame(height: container.size.height / 3)
            }
            .background(Image("wood_maple").scaledToFill())
            .sheet(isPresented: $showingSheet, onDismiss: {
                playedCard = simulateRound()
            }, content: {
                switch shownSelectorSheetType {
                case .player, .card:
                    PlayerSelectorView(isShowing: $showingSheet, selectedPlayer: $game.currentTarget, didSelect: {
                            selectedCard!.play()
                        let card: PlayableCard = selectedCard as! PlayableCard
                        
                        game.playedDeck.append(game.players.first!.character.hand.remove(at: game.players.first!.character.hand.firstIndex(where: {$0 as? PlayableCard == card})!))
                    })
                case .playerCard:
                    PlayerCardSelectorView(selectedPlayer: game.currentTarget, selectedCardIndex: $selectedTargetCardIndex, isShowing: $showingSheet, selectedCardType: $selectedCardType, didSelect: {
                            selectedCard!.play()
                        
                        let card: PlayableCard = selectedCard as! PlayableCard
                        
                        game.playedDeck.append(game.players.first!.character.hand.remove(at: game.players.first!.character.hand.firstIndex(where: {$0 as? PlayableCard == card})!))
                    })
                }
            })
        }
    }
    
    func simulateRound() -> DrawableCard {
        var lastCard: DrawableCard?
        for i in 1..<game.players.count {
            game.currentPlayer = game.players[i]
            let card = game.players[i].character.hand.first!
            switch card.cardSheetType {
            case .player:
                game.currentTarget = game.players.first
            case .none:
                break
            case .card:
                game.selectedCard = game.drawDeck.removeFirst()
            case .playerCard:
                game.currentTarget = game.players.first
                game.selectedCard = game.currentTarget!.character.takeCard(type: .playable, index: 0)
            }
            lastCard = game.players[i].character.hand.first! as DrawableCard
            game.playedDeck.append(game.players[i].character.hand.removeFirst())
        }
        print("Game.shared---------------------------------------")
        print(Game.shared.players)
        print("game---------------------------------------")
        print(game.players)
        for player in game.players {
            if player == game.players.first! {
                print(player.character.hand)
            }
            player.character.drawCard(n: 2)
        }
        return lastCard!
    }
}



struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(selectedGameMode: .constant(.singlePlayer), previousGameMode: .constant(.menu), character: try! BartCassidyCharacter())
            
    }
}
