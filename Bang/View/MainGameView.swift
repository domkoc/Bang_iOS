//
//  GameScreen.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

struct MainGameView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
