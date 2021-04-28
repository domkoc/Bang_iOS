//
//  PlayerSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 28..
//

import SwiftUI

struct PlayerSelectorView: View {
    
    @Binding var isShowing: Bool
    @Binding var selectedPlayer: Player?
    
    var didSelect: () -> ()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(Game.shared.players, id: \.self) { player in
                    Button(action: {
                        selectedPlayer = player
                        Game.shared.currentTarget = selectedPlayer
                        isShowing = false
                        
                        didSelect()
                    })  {
                        Image(player.character.cardImageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
            }
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct PlayerSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectorView(isShowing: .constant(true), selectedPlayer: .constant(nil), didSelect: {})
    }
}
