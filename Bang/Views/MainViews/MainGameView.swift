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
    
    @State var cards: [DrawableCard] = Game.shared.players.first!.character.hand
    @Binding var selectedGameMode: GameMode
    @Binding var previousGameMode: GameMode
    @State var equipped = [PowerCard]()
    @State var game: Game = Game.shared
    @State var weapon: WeaponCard? = nil
    @State var selectedTarget: Player? = Game.shared.currentTarget
    @State var selectedTargetCardIndex: Int? = 0
    @State var showingCardSelectorView: Bool = false
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var shownSheetType: sheetType = .card
    @State var selectedCard: DrawableCard? = nil
    
    var character: Character
    
    var body: some View {
        GeometryReader { container in
            VStack {
                HStack {
                    Button(action: {
                        print("Pressed left pile")
                    }, label: {
                        ZStack {
                            if game.playedDeck.isEmpty {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            } else {
                                Image(game.playedDeck.last!.cardImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                            VStack {
                                Spacer().frame(height: 8)
                                Text("#" + String(Game.shared.playedDeck.count))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
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
                                Spacer()
                            }
                                
                        }
                    })
                }.frame(height: container.size.height / 3)
                HStack {
                    ForEach(0..<cards.count, id: \.self) { i in
                        Button(action: {
                            if cards[i].cardSheetType == nil {
                                showingSheet = false
                                cards[i].play()
                                Game.shared.playedDeck.append(cards.remove(at: i))
                            } else {
                                self.selectedCard = cards[i]
                                shownSheetType = cards[i].cardSheetType!
                                showingSheet = true
                            }
                        })  {
                            Image(cards[i].cardImageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("A kártya jelenleg nem játszható ki!"), message: nil, dismissButton: .default(Text("OK")))
                        }
                    }
                        
                    /*
                    Button(action: {
                            print("Pressed 1st card")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })
                    Button(action: {
                        print("Pressed 2nd card")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })
                    Button(action: {
                        print("Pressed 3rd card")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })
                    Button(action: {
                        print("Pressed 4th card")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })
                    Button(action: {
                        print("Pressed 5th card")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })*/
                }.frame(height: container.size.height / 3)
                VStack {
                    HStack {
                        HStack{
                            Button(action: {
                                    print("Pressed 1st card")
                            }, label: {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                print("Pressed 2nd card")
                            }, label: {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                print("Pressed 3rd card")
                            }, label: {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                print("Pressed 4th card")
                            }, label: {
                                Image("backCard")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            })
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
                                        
                                    }.frame(height: container.size.height / 20)
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
                                    // TODO: Remove testing purpose
                                    showingCardSelectorView.toggle()
                                }) {
                                    Image(systemName: "questionmark.circle")
                                }.sheet(isPresented: $showingCardSelectorView,content: {
                                    PlayerCardSelectorView(selectedPlayer: $selectedTarget, selectedCardIndex: $selectedTargetCardIndex, isShowing: $showingCardSelectorView, didSelect: {
                                        print("Selected card")
                                    })
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
            .sheet(isPresented: $showingSheet, content: {
                switch shownSheetType {
                case .player, .card:
                    PlayerSelectorView(isShowing: $showingSheet, selectedPlayer: $selectedTarget, didSelect: {
                            selectedCard!.play()
                        let card: PlayableCard = selectedCard as! PlayableCard
                        
                        Game.shared.playedDeck.append(cards.remove(at: cards.firstIndex(where: {$0 as? PlayableCard == card})!))
                    })
                case .playerCard:
                    PlayerCardSelectorView(selectedPlayer: $selectedTarget, selectedCardIndex: $selectedTargetCardIndex, isShowing: $showingSheet, didSelect: {
                            selectedCard!.play()
                        
                        let card: PlayableCard = selectedCard as! PlayableCard
                        
                        Game.shared.playedDeck.append(cards.remove(at: cards.firstIndex(where: {$0 as? PlayableCard == card})!))
                    })
                }
            })
        }
    }
}



struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(selectedGameMode: .constant(.singlePlayer), previousGameMode: .constant(.menu), character: try! BartCassidyCharacter())
            
    }
}
