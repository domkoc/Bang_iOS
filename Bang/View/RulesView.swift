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
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}

struct PDFKitView: View {
    var url: URL
    
    var body: some View {
        PDFKitRepresentedView(url)
    }
}

struct RulesView: View {
    let documentURL = Bundle.main.url(forResource: "rulebook", withExtension: "pdf")!
    var body: some View {
        PDFKitView(url: documentURL)
            .ignoresSafeArea()
    }
}

struct RulesScreen_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
