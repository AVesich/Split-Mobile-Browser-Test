//
//  DragLocationView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import SwiftUI

struct SnapLocationView: UIViewRepresentable {
    
    @Binding public var targetIsDragging: Bool
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
    func shouldTargetSnap(fromLocation endDragLocation: CGPoint) -> Bool {
        let MIN_SIZE_WITH_BORDER = 96.0 // Views larger than 96x96 will ignore drags ended within 24.0 of their edge to make snapping less touchy
        let BORDER_SIZE = 24.0 // Border of ignorance to touches
        if view.frame.width >= MIN_SIZE_WITH_BORDER &&
           view.frame.height >= MIN_SIZE_WITH_BORDER { // Calculate with snap border
            let borderedRect = CGRect(origin: view.frame.origin.applying(CGAffineTransform(translationX: BORDER_SIZE,
                                                                                           y: BORDER_SIZE)),
                                      size: CGSize(width: view.frame.width - BORDER_SIZE*2,
                                                   height: view.frame.width - BORDER_SIZE*2))
            return borderedRect.contains(endDragLocation)
        } else { // Calculate without border
            return view.frame.contains(endDragLocation)
        }
    }
}
