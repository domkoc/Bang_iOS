//
//  GameScreen.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

struct MainGameView: View {
    
    @Binding var selectedGameMode: GameMode
    
    var body: some View {
        VStack {
            Text("Hello, Bang!")
                .font(Font.custom("FortDeath", size: 40))
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(selectedGameMode: .constant(.singlePlayer))
    }
}
