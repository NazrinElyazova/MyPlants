//
//  DetailViewModel.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import Foundation
import UIKit

class DetailViewModel {
    
    struct DetailModel {
        var size: String
        var row: String
        var detailImg: UIImage
    }
    
    var model = [DetailModel(size: "Small", row: "Height", detailImg: UIImage(named: "height")!),
    DetailModel(size: "Normal", row: "Light", detailImg: UIImage(named: "light")!),
    DetailModel(size: "333ml", row: "Water", detailImg: UIImage(named: "water")!),
    DetailModel(size: "56%", row: "Humidity", detailImg: UIImage(named: "humidity")!)]
}
