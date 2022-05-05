//
//  MapCollectionHeader.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import UIKit
import MapKit

class MapCollectionHeader: UICollectionViewCell {
    static let identifier = "MapCollectionHeader"
    
    let mapView = MKMapView(frame: .zero)
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
