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
    
    var body: some View {
        return Group {
            
            switch selectedGameMode {
            case .singlePlayer, .multiPlayer:
                MainGameView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode)
            case .rules:
                RulesView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode)
            case .menu:
                WelcomeView(selectedGameMode: $selectedGameMode, previousGameMode: $previousGameMode)
            }
        }
    }
}

struct ModeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSelectorView()
    }
}
