//
//  PhotoAlbumView.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import UIKit
import MapKit
import CoreData

class PhotoAlbumViewController: UIViewController {
    
    let activityIndicator = UIActivityIndicatorView()
    @objc let addNewCollection = UIButton()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: PhotoCollectionViewController())
    let coordinate: CLLocationCoordinate2D
    var dataController: DataController!
    var pin: Pin!
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .clear
        collectionView.register(
            MapCollectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "MapCollectionHeader")
        collectionView.register(
            PhotoCollectionViewController.self,
            forCellWithReuseIdentifier: PhotoCellViewController.identifier)
        
        collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        if let layout = collectionView.collectionViewLayout as? PhotoCollectionViewController {
            layout.setWidth(width: view.frame.width)
        }
    }
    
    func setUpCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.backgroundColor = .white
    }
    
    func setUpAddCollectionButton() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        view.addSubview(containerView)
        
        let stackView = UIStackView(arrangedSubviews: [addNewCollection, activityIndicator])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        containerView.addSubview(stackView)
        
        addNewCollection.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        addNewCollection.setTitleColor(.systemBlue, for: .normal)
        addNewCollection.setTitle("New Collection", for: .normal)
        addNewCollection.addTarget(self, action: #selector(getter: addNewCollection), for: .touchUpInside)
        
        activityIndicator.color = .systemBlue
        activityIndicator.hidesWhenStopped = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    }
    
    func setActivityIndicatorOn(_ isOn: Bool) {
        addNewCollection.isHidden = isOn
        if isOn {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        dataSource.deletePhoto(at: indexPath)
//        collectionView.deleteItems(at: [indexPath])
//    }
//}
//
//extension PhotoAlbumViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 150)
//    }
}

