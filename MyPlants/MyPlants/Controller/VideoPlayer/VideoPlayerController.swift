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
    
    var player: AVPlayer?
    var progress: Progress?
    
    @IBOutlet weak var video: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var customView: CustomView! {
        didSet {
            customView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playTheVideo()
    }
    
    func playTheVideo() {
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "AloeProduct", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = video.bounds
        layer.videoGravity = .resizeAspectFill
        videoView.layer.addSublayer(layer)
        player?.play()
    }
}

extension VideoPlayerController: TimeDelegate {
    func setVideoTime(result: Float) {
        if let player = player {
            let duration = CMTimeGetSeconds(player.currentItem!.duration)
            let seekTime = duration * Double(result)
            let time = CMTime(seconds: seekTime, preferredTimescale: 1)
            player.seek(to: time)
        }
    }
}
