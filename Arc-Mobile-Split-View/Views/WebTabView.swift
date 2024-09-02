//
//  TabView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct WebTabView: View {
    
    @State private var isFullscreen = true
    @State private var isDragging = false
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
//        WebView(urlString: "https://google.com")
        Rectangle()
            .overlay {
                Rectangle()
                    .fill(.black.opacity(0.001))
                    .onTapGesture {
                        if !isDragging {
                            dragOffset = CGSize.zero
                            isFullscreen = true
                        }
                    }
                    .gesture(
                        DragGesture(minimumDistance: 8.0)
                            .onChanged { gestureData in
                                isFullscreen = false
                                isDragging = true
                                dragOffset = gestureData.translation
                            }
                            .onEnded { value in
                                isDragging = false
                            }
                    )

            }
            .offset(dragOffset)
            .animation(.easeInOut(duration: 0.1), value: dragOffset)
            .opacity(isDragging ? 0.6 : 1.0)
            .animation(.easeInOut(duration: 0.3), value: isDragging)
            .padding(isFullscreen ? 0.0 : 24.0)
            .ignoresSafeArea(edges: isFullscreen ? .bottom : [])
//            .allowsHitTesting(!isDragging)
            
    }
}

#Preview {
    WebTabView()
}
