//
//  DescriptionCell.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import UIKit

class DescriptionCell: UICollectionViewCell {

    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(TypeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TypeCell.self)")
    }
}

extension DescriptionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TypeCell.self)", for: indexPath) as! TypeCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
