//
//  CategoryCell.swift
//  MyPlants
//
//  Created by Nazrin on 02.04.24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var item = CategoryViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collection.dataSource = self
        collection.delegate = self
        
        collection.register(UINib(nibName: "\(CategorySectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategorySectionCell.self)")
        
    }
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategorySectionCell.self)", for: indexPath) as! CategorySectionCell
        cell.categoryImage.image = item.model[indexPath.item].image
        cell.livingLabel.text = item.model[indexPath.item].room
        cell.plantLabel.text = item.model[indexPath.item].plant
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: collectionView.frame.height/2 - 10)
    }
    
}
