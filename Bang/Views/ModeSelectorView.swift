//
//  ModeSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 07..
//

import SwiftUI

struct ModeSelectorView: View {
    
    @State var selectedGameMode: GameMode = .menu
    @State var previousGameMode: GameMode = .menu
    @State var selectedCharacter: Character?
    
    var body: some View {
        return Group {
            
            switch selectedGameMode {
            case .singlePlayer, .multiPlayer:
                MainGameView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode, character: selectedCharacter!)
            case .rules:
                RulesView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode)
            case .menu:
                WelcomeView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode, selectedCharacter: $selectedCharacter)
            }
        }
    }
}

struct ModeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSelectorView()
    }
}
