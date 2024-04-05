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

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "AloeProduct", ofType: "mov")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect
        view.layer.addSublayer(layer)
        
        player.play()
    }
    
}
