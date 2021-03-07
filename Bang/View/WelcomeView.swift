//
//  ContentView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var selectedGameMode: GameMode
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            //RulesScreen()
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
                    .cornerRadius(25)
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    self.selectedGameMode = .singlePlayer
                    //GameScreen()
                }) {
                    Text("Play")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(25)
                }
                .background(Color.red)
                .clipShape(Circle())
                
                Spacer()
                    .frame(height: 25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedGameMode: .constant(.menu))
    }
}
