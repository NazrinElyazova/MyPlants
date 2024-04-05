//
//  VideoPlayerController.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerController: UIViewController {
    
    @IBOutlet weak var videoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoImage.clipsToBounds = true
        videoImage.layer.cornerRadius = 20
    }

    @IBAction func playActionButton(_ sender: Any) {
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "AloeProduct", ofType: "mov")!))
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
    }
}
