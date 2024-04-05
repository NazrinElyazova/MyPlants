//
//  MyPlantViewModel.swift
//  MyPlants
//
//  Created by Nazrin on 03.04.24.
//

import Foundation
import UIKit


struct PlantModel {
    var plantImage: UIImage
    var fits: String
    var name: String
}


class MyPlantViewModel {
    var model = [PlantModel(plantImage: UIImage(named: "aloe1")!,
                            fits: "Fits well",
                            name: "Peperomia Houseplant"),
                 
                 PlantModel(plantImage: UIImage(named: "aloe2")!,
                            fits: "Fits well", name: "Asplenium Houseplant")]
    
}
