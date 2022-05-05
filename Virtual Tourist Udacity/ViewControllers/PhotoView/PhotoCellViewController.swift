//
//  PhotoCellView.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import UIKit

class PhotoCellViewController: UICollectionViewCell {
    static let identifier = "PhotoCollectionView"
    
    let photoCellView = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoCellView.image = nil
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        photoCellView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoCellView)
        photoCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        photoCellView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
