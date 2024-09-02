//
//  SnapTargetView.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

protocol SnapTargetView {
    var snapLocations: [SnapLocationView] { get set }
    
    func addSnapLocation(_ locationView: SnapLocationView)
}
