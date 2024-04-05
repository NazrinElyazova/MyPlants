//
//  TutorialViewModel.swift
//  MyPlants
//
//  Created by Nazrin on 03.04.24.
//

import Foundation
import UIKit

class TutorialViewModel {
    
    struct TutorialModel {
        var image: UIImage
        var water: String
        var age: String
    }
    
    var model = [TutorialModel(image: UIImage(named: "play")!, water: "Water your Cactus today (living room)", age: "It’s 2 weeks old, you have to water it twice a w..."),
                 TutorialModel(image: UIImage(named: "playBambo")!, water: "Prune the dead branches of Bamboo t... ", age: "It’s been 2-3 weeks since you have prune the d... ")]
}
