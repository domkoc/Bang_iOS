//
//  RulesScreen.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 03..
//

import SwiftUI
import PDFKit

struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
    }
}

struct PDFKitView: View {
    var url: URL
    
    var body: some View {
        PDFKitRepresentedView(url)
    }
}

struct RulesView: View {
    
    @Binding var selectedGameMode: GameMode
    @Binding var previousGameMode: GameMode
    
    let documentURL = Bundle.main.url(forResource: "rulebook", withExtension: "pdf")!
    var body: some View {
        NavigationView {
            PDFKitView(url: documentURL)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Rules").font(Font.custom("FortDeath", size: 40))
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done", action: {
                            self.selectedGameMode = previousGameMode
                        })
                    }
                }
                /*.navigationTitle(Text("Rules"))
                .navigationBarItems(trailing:
                                        Button("done", action: {
                                            self.selectedGameMode = .menu
                                        })
                )*/
        }
    }
}

struct RulesScreen_Previews: PreviewProvider {
    static var previews: some View {
        RulesView(selectedGameMode: .constant(.rules), previousGameMode: .constant(.menu))
    }
}
