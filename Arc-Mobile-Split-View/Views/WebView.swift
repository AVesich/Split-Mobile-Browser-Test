//
//  WebView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let webView = uiView // Rename for readability
    
        webView.load(URLRequest(url: url))
    }
}
