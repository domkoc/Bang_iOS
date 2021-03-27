//
//  ContentView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var selectedGameMode: GameMode
    @Binding var previousGameMode: GameMode
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //RulesScreen()
                        self.previousGameMode = .menu
                        self.selectedGameMode = .rules
                    }) {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                        .frame(width: 25)
                }
                Image("Logo")
                .resizable()
                .scaledToFit()
                .padding()
            }
            
            Spacer()
            
            Button(action: {
                self.previousGameMode = .menu
                self.selectedGameMode = .singlePlayer
                //GameScreen()
            }) {
                Text("PlaY")
                    .foregroundColor(.white)
                    .padding(25)
                    .font(Font.custom("FortDeath", size: 40))
            }
            .background(Color.red)
            .clipShape(Circle())
            
            Spacer()
                .frame(height: 25)
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedGameMode: .constant(.menu), previousGameMode: .constant(.menu))
    }
}
