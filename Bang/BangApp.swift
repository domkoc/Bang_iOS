//
//  BangApp.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI

@main
struct BangApp: App {
    
    @State var playPressed = false
    
    var body: some Scene {
        WindowGroup {
            ModeSelectorView()
        }
    }
}
