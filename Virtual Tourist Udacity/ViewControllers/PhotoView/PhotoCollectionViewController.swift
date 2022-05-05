//
//  PhotoCollectionView.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewFlowLayout {
    
    static let spacing: CGFloat = 0.4
    
    override init() {
        super.init()
        self.itemSize = .zero
        self.sectionInset = UIEdgeInsets(
            top: PhotoCollectionViewController.spacing,
            left: 0,
            bottom: 0,
            right: 0)
        self.minimumLineSpacing = Self.spacing
        self.minimumLineSpacing = Self.spacing
        self.scrollDirection = .vertical
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not bee implemented.")
    }
    
    func setWidth(width: CGFloat) {
        let itemWidth = (width - Self.spacing * 2)/3.0
        self.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
}
