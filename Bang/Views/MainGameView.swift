//
//  GameScreen.swift
//  Bang
//
//  Created by Kocka Dominik on 1021. 03. 03..
//

import SwiftUI

struct MainGameView: View {
    
    @Binding var selectedGameMode: GameMode
    @Binding var previousGameMode: GameMode
    @State var equipped = [PowerCard]()
    @State var game: Game = Game.shared
    
    var body: some View {
        GeometryReader { container in
            VStack {
                HStack {
                    Button(action: {
                        print("Pressed left pile")
                    }, label: {
                        if game.playedDeck.isEmpty {
                            Image("backCard")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                        } else {
                            game.playedDeck.last!.cardImage
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                        }
                    })
                    Button(action: {
                            print("Pressed right pile")
                    }, label: {
                        Image("backCard")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    })
                }.frame(height: container.size.height / 3)
                HStack {
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
                    })
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
                            Image("tray1")
                                .resizable()
                                .scaledToFit()
                        }).frame(height: container.size.height / 5.5)
                        Spacer().frame(width: container.size.width / 6)
                        VStack {
                            HStack {
                                Button(action: {
                                    print("Pressed quick")
                                }) {
                                    Image(systemName: "questionmark.circle")
                                }
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
                        }.frame(width: 75)
                    }
                }.frame(height: container.size.height / 3)
            }
            .background(Image("wood_maple").scaledToFill())
        }
    }
}



struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(selectedGameMode: .constant(.singlePlayer), previousGameMode: .constant(.menu))
            
    }
}
