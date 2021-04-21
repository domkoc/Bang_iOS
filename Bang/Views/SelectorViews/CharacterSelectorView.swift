//
//  CharacterSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 04. 21..
//

import SwiftUI

struct CharacterSelectorView: View {
    
    @Binding var isShowing: Bool
    @Binding var selectedCharacter: Character?
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(Game.shared.allCharactersList(), id: \.self) { character in
                    Button(action: {
                        selectedCharacter = character
                        isShowing = false
                    })  {
                        Image(character.cardImageName)
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

struct CharacterSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSelectorView(isShowing: .constant(true), selectedCharacter: .constant(nil))
    }
}
