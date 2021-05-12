//
//  QuickHelpView.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 05. 12..
//

import SwiftUI

struct QuickHelpView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Image("help")
                .resizable()
                .scaledToFit()
        }
        .background(Image("wood_maple").scaledToFill())
    }
}

struct QuickHelpView_Previews: PreviewProvider {
    static var previews: some View {
        QuickHelpView(isShowing: .constant(true))
    }
}
