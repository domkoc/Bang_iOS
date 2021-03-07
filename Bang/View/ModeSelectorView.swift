//
//  ModeSelectorView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 07..
//

import SwiftUI

struct ModeSelectorView: View {
    
    @State var selectedGameMode: GameMode = .menu
    
    var body: some View {
        return Group {
            
            switch selectedGameMode {
            case .singlePlayer, .multiPlayer:
                MainGameView(selectedGameMode: $selectedGameMode)
            case .rules:
                RulesView(selectedGameMode: $selectedGameMode)
            case .menu:
                WelcomeView(selectedGameMode: $selectedGameMode)
            }
        }
    }
}

struct ModeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSelectorView()
    }
}
