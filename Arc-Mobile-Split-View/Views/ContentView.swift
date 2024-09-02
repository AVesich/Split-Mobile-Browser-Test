//
//  ContentView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    
//    let tabData: Tab = .defaultTab
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 24.0) {
                SnapLocationView(targetIsDragging: .constant(false),
                                 debugColor: .red)
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
//                RoundedRectangle(cornerRadius: 16.0)
//                    .fill(.red)
//                    .gesture(
//                        TapGesture()
//                            .onEnded { 
//                                print("red")
//                            }
//                    )
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(.blue)
            }
            .padding()
//            WebTabView()
        }
    }
}

#Preview {
    ContentView()
}
