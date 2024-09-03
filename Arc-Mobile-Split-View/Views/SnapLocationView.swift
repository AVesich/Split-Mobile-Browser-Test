//
//  DragLocationView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct SnapTargetData: Hashable {
    let id: UUID
    let frame: CGRect
}

struct SnapLocationView<Content: View>: View {
    
    @Binding public var frame: CGRect
//    @State public var frame: CGRect = .zero
    public var content: () -> Content
    private let id = UUID()
    public var snapTargetData: SnapTargetData {
        SnapTargetData(id: id, frame: frame)
    }
    
    init(frame: Binding<CGRect>, @ViewBuilder content: @escaping () -> Content) {
        self._frame = frame
        self.content = content
    }
    
    var body: some View {
        content()
            .background { // Background will match the size of the content, preventing the GeometryReader from taking up all of the space
                GeometryReader { context in
                    Rectangle()
                        .fill(.clear)
                        .onAppear {
                            frame = context.frame(in: .named("SnappingSpace"))
                        }
                        .onChange(of: context.frame(in: .named("SnappingSpace"))) {
                            frame = context.frame(in: .named("SnappingSpace"))
                        }
                }
            }
    }
}

/*
struct SnapLocationView: UIViewRepresentable {
    
    public var debugColor: UIColor = .clear
    public var viewFrame: CGRect {
        return view.frame
    }
    private let view = UIView()
    
    // MARK: - Required methods
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.backgroundColor = debugColor
    }
    
    // MARK: - Drag detect method
    func targetShouldSnap(fromLocation endDragLocation: CGPoint) -> Bool {
//        dump(endDragLocation)

//        let MIN_SIZE_WITH_BORDER = 96.0 // Views larger than 96x96 will ignore drags ended within 24.0 of their edge to make snapping less touchy
//        let BORDER_SIZE = 24.0 // Border of ignorance to touches
//        if view.frame.width >= MIN_SIZE_WITH_BORDER &&
//           view.frame.height >= MIN_SIZE_WITH_BORDER { // Calculate with snap border
//            let borderedRect = CGRect(origin: view.frame.origin.applying(CGAffineTransform(translationX: BORDER_SIZE,
//                                                                                           y: BORDER_SIZE)),
//                                      size: CGSize(width: view.frame.width - BORDER_SIZE*2,
//                                                   height: view.frame.width - BORDER_SIZE*2))
//            return borderedRect.contains(endDragLocation)
//        } else { // Calculate without border
            return view.frame.contains(endDragLocation)
//        }
    }
}
*/
