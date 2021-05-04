//
//  CardSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 21..
//

import SwiftUI

struct PlayerCardSelectorView: View {
    
    @Binding var selectedPlayer: Player?
    @Binding var selectedCardIndex: Int?
    @Binding var isShowing: Bool
    //@State var characterChosen: Player? = nil
    
    var didSelect: () -> ()
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 8)
            Picker(selection: $selectedPlayer, label: Text("Select a player"), content: {
                ForEach(Game.shared.players) { player in
                    Text(player.character.name.rawValue).tag(player as Player?)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            if selectedPlayer != nil {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<selectedPlayer!.character.hand.count, id: \.self) { i in
                            Button(action: {
                                selectedCardIndex = i
                                Game.shared.currentTarget = selectedPlayer
                                Game.shared.currentTargetCardIndex = selectedCardIndex
                                isShowing = false
                                
                                didSelect()
                            })  {
                                Image(selectedPlayer!.character.hand[i].cardImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            } else {
                Button(action: {
                    print(selectedPlayer)
                }, label: {
                    Text("Válassz egy játékost!")
                })
            }
            Spacer()
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct PlayerCardSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardSelectorView(selectedPlayer: .constant(nil), selectedCardIndex: .constant(nil), isShowing: .constant(true), didSelect: {})
    }
}
