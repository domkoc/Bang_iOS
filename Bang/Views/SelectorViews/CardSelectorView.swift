//
//  CardSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 21..
//

import SwiftUI

struct CardSelectorView: View {
    
    @Binding var selectedCharacter: Player?
    @Binding var selectedCardIndex: Int?
    @Binding var isShowing: Bool
    //@State var characterChosen: Player? = nil
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 8)
            Picker(selection: $selectedCharacter, label: Text("Select a player"), content: {
                ForEach(Game.shared.players) { player in
                    Text(player.character.name.rawValue).tag(player as Player?)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            if selectedCharacter != nil {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<selectedCharacter!.character.hand.count, id: \.self) { i in
                            Button(action: {
                                selectedCardIndex = i
                                isShowing = false
                            })  {
                                Image(selectedCharacter!.character.hand[i].cardImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            } else {
                Button(action: {
                    print(selectedCharacter)
                }, label: {
                    Text("Válassz egy játékost!")
                })
            }
            Spacer()
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct CardSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CardSelectorView(selectedCharacter: .constant(nil), selectedCardIndex: .constant(nil), isShowing: .constant(true))
    }
}
