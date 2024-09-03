//
//  ContentView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    
//    let tabData: Tab = .defaultTab
//    let blueLocation = SnapLocationView {
//        RoundedRectangle(cornerRadius: 16.0)
//            .fill(.blue)
//    }
    @State public var frame1: CGRect = .zero
    @State public var frame2: CGRect = .zero
    @State public var frame3: CGRect = .zero
    @State public var frame4: CGRect = .zero
    @State private var locations = [Binding<CGRect>]()
    
    var body: some View {
        ZStack {
            HStack(spacing: 24.0) {
                VStack(spacing: 24.0) {
                    SnapLocationView(frame: $frame1) {
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(.red)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    SnapLocationView(frame: $frame2) {
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(.blue)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                }
                VStack(spacing: 24.0) {
                    SnapLocationView(frame: $frame3) {
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(.green)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    SnapLocationView(frame: $frame4) {
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(.purple)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                }
            }
            .padding()
            SnappingView(snappableFrames: [frame1, frame2, frame3, frame4]) {
                WebTabView()
//                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
            }
        }
        .coordinateSpace(name: "SnappingSpace")
        .onAppear {
//            locations.append(redLocation.$frame)
//            locations.append(blueLocation.$frame)
        }
    }
}

#Preview {
    ContentView()
}
