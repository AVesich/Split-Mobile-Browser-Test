//
//  SnappingView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct SnappingView<Content: View>: View {
    
    public var minDragDistance: CGFloat = 8.0
    public var content: () -> Content
    public var snappableFrames: [CGRect]
    @State private var defaultFrame = CGRect.zero
    @State private var snapFrame: CGRect?
    @State private var isDragging = false
    @State private var dragOffset = CGSize.zero
    @State private var expectingResize = false
    private var contentOffset: CGSize {
        var base = CGSize.zero
        if let snapFrame {
            base = .init(width: snapFrame.minX - defaultFrame.origin.x,
                         height: snapFrame.minY - defaultFrame.origin.y)
        }
        if isDragging {
            return CGSize(width: base.width + dragOffset.width,
                          height: base.height + dragOffset.height)
        }
        return base
    }
        
    init(snappableFrames: [CGRect], @ViewBuilder content: @escaping () -> Content) {
        self.snappableFrames = snappableFrames
        self.content = content
    }
    
    var body: some View {
        ZStack {
            content()
                .onTapGesture {
                    snapFrame = nil
                }
                .offset(contentOffset)
                .frame(width: snapFrame?.width, height: snapFrame?.height)//, alignment: .center)
                .scaleEffect(isDragging ? 0.8 : 1.0)
                .opacity(isDragging ? 0.8 : 1.0)
                .background {
                    GeometryReader { context in
                        Rectangle()
                            .fill(.clear)
                            .onAppear {
                                defaultFrame = context.frame(in: .named("SnappingSpace"))
                            }
                            .onChange(of: context.frame(in: .named("SnappingSpace"))) {
                                if !expectingResize {
                                    defaultFrame = context.frame(in: .named("SnappingSpace"))
                                }
                                expectingResize = false
                            }
                    }
                }
        }
        .gesture(
            DragGesture(minimumDistance: 0.8, coordinateSpace: .named("SnappingSpace"))
                .onChanged { dragData in
                    isDragging = true
                    dragOffset = dragData.translation
                }
                .onEnded { dragData in
                    checkForSnap(withLocation: dragData.location)
                    dragOffset = CGSize.zero
                    isDragging = false
                }
        )
        .animation(.spring(response: 0.25, dampingFraction: 0.7, blendDuration: 0.5), value: snapFrame)
        .animation(.easeInOut(duration: 0.1), value: dragOffset)
    }
    
    // Snap to the first valid location. It is a programmer error if there are overlapping snap locations.
    private func checkForSnap(withLocation endDragLocation: CGPoint) {
        for frame in snappableFrames {
            if frame.contains(endDragLocation) {
                snapFrame = frame
                return
            }
        }
    }
}
