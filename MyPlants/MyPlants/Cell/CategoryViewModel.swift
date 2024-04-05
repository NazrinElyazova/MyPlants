//
//  CategoryViewModel.swift
//  MyPlants
//
//  Created by Nazrin on 03.04.24.
//

import Foundation
import UIKit

class CategoryViewModel {
    
    struct CategoryModel {
        var image: UIImage
        var plant: String
        var room: String
    }
    
    var model = [CategoryModel(image: UIImage(named: "green")!, plant: "2 Plants", room: "Living room"),
    CategoryModel(image: UIImage(named: "yellow")!, plant: "2 Plants", room: "Drawing room"),
    CategoryModel(image: UIImage(named: "purple")!, plant: "1 Plant", room: "Kitchen"),
    CategoryModel(image: UIImage(named: "pink")!, plant: "8 Plants", room: "Backyard")]

}
