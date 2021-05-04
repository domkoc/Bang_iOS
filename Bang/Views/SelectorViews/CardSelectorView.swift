//
//  CardSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 05. 04..
//

import SwiftUI

struct CardSelectorView: View {
    
    @Binding var isShowing: Bool
    @Binding var selectedCard: DrawableCard?
    @Binding var cardsToSelectFrom: [DrawableCard]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<cardsToSelectFrom.count, id: \.self) { i in
                    Button(action: {
                        selectedCard = cardsToSelectFrom[i]
                        isShowing = false
                    })  {
                        Image(cardsToSelectFrom[i].cardImageName)
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

struct CardSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CardSelectorView(isShowing: .constant(true), selectedCard: .constant(nil), cardsToSelectFrom: .constant(Game.shared.drawDeck))
    }
}
