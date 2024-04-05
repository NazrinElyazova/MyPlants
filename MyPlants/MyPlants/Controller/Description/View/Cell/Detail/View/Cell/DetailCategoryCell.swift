//
//  DetailCategoryCell.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import UIKit

class DetailCategoryCell: UICollectionViewCell {
    var items = DetailViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.register(UINib(nibName: "\(DetailCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DetailCell.self)")
        
        collection.delegate = self
        collection.dataSource = self
    }
    
}

extension DetailCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailCell.self)", for: indexPath) as! DetailCell
        
        let data = items.model[indexPath.item]
        cell.detailImage.image = data.detailImg
        cell.rowLabel.text = data.row
        cell.sizeLabel.text = data.size
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2)
    }
}
