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
    
    @IBOutlet weak var video: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var customView: CustomView! {
        didSet {
            customView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playTheVideo()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player?.pause()
    }
    
    func playTheVideo() {
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "AloeProduct", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = video.bounds
        layer.videoGravity = .resizeAspectFill
        videoView.layer.addSublayer(layer)
        player?.play()
        customView.setupPlayer(player: player!)
    }
    
    private func seekVideo(seconds: Double) {
        guard let player = player else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + seconds
        
        let duration = CMTimeGetSeconds(player.currentItem?.duration ?? CMTime(seconds: 1, preferredTimescale: 1))
        
        if newTime > 0 && newTime < duration {
            let time = CMTime(seconds: newTime, preferredTimescale: 1)
            player.seek(to: time)
        }
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
    
    func gobackVideo(seconds: Double) {
        seekVideo(seconds: -seconds)
        
    }
    
    func goForwardVideo(seconds: Double) {
        seekVideo(seconds: seconds)
        
    }
}
