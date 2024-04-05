//
//  MyPlantsController.swift
//  MyPlants
//
//  Created by Nazrin on 02.04.24.
//

import UIKit

class MyPlantsController: UIViewController, GoToControllerProtocol {
    var myPlant = MyPlantViewModel()
    
    func goToVideo() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(VideoPlayerController.self)") as! VideoPlayerController

        navigationController?.show(controller, sender: nil)
    }
    
    func go() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(DescriptionController.self)") as! DescriptionController
        controller.flower = myPlant 

        navigationController?.show(controller, sender: nil)
    }
    
     
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: "\(MyPlantCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(MyPlantCell.self)")
        collection.register(UINib(nibName: "\(PopularCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PopularCell.self)")
        collection.register(UINib(nibName: "\(CategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategoryCell.self)")
        collection.register(UINib(nibName: "\(TutorialsCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TutorialsCell.self)")
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AddController.self)") as! AddController
        navigationController?.show(controller, sender: nil)

    }
}

extension MyPlantsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
           switch indexPath.item {
           case 0:

               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyPlantCell.self)", for: indexPath) as! MyPlantCell
               cell.delegate = self
               return cell
   
           case 1:
             let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCell.self)", for: indexPath) as! CategoryCell
               return cell

           case 2:
            let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TutorialsCell.self)", for: indexPath) as! TutorialsCell
               cell.delegate = self
               return cell

           default:
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyPlantCell.self)", for: indexPath) as! MyPlantCell
               return cell
           }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
}
