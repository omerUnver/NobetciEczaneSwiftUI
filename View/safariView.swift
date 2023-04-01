//
//  safariView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 1.04.2023.
//

import SwiftUI
import SafariServices
struct safariView: UIViewControllerRepresentable {
        let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<safariView>) {
            return
        }
    
}
