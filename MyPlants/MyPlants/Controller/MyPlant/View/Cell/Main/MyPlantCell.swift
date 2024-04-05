//
//  MyPlantCell.swift
//  MyPlants
//
//  Created by Nazrin on 02.04.24.
//

import UIKit

protocol GoToControllerProtocol {
    func go()
    func goToVideo()
}

class MyPlantCell: UICollectionViewCell {
    
    var item = MyPlantViewModel()
    var delegate: GoToControllerProtocol?

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.register(UINib(nibName: "\(PopularCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PopularCell.self)")
    }
}

extension MyPlantCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PopularCell.self)", for: indexPath) as! PopularCell
        let option = item.model[indexPath.item]
        cell.aloeImage.image = option.plantImage
        cell.fitsLabel.text = option.fits
        cell.nameLabel.text = option.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        .init(width: collectionView.frame.width / 2, height: 154)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.go()
    }
}
