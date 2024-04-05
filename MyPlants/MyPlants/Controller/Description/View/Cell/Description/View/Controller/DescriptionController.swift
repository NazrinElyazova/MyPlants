//
//  DescriptionController.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import UIKit

class DescriptionController: UIViewController {
    
    var flower: MyPlantViewModel?
    
    @IBOutlet weak var flowerPicture: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(DescriptionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DescriptionCell.self)")
        
        collection.register(UINib(nibName: "\(WikipediaCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(WikipediaCell.self)")
        
        collection.register(UINib(nibName: "\(DetailCategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DetailCategoryCell.self)")
        
        collection.layer.cornerRadius = 35
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let firstPlant = flower?.model.first {
            flowerPicture.image = firstPlant.plantImage
        }
    }
}

extension DescriptionController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DescriptionCell.self)", for: indexPath) as! DescriptionCell
            return cell
            
        case 1:
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(WikipediaCell.self)", for: indexPath) as! WikipediaCell
            return cell
            
        case 2:
            let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailCategoryCell.self)", for: indexPath) as! DetailCategoryCell
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DescriptionCell.self)", for: indexPath) as! DescriptionCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
                .init(width: collectionView.frame.width, height: 138)
        case 1:
                .init(width: collectionView.frame.width, height: 210)
        case 2:
                .init(width: collectionView.frame.width, height: 196)
            
        default:
                .init(width: collectionView.frame.width, height: 90)
        }
    }
    
}
