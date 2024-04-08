//
//  CustomView.swift
//  MyPlants
//
//  Created by Nazrin on 05.04.24.
//

import UIKit
import AVFoundation

protocol TimeDelegate {
    func setVideoTime(result: Float)
    func gobackVideo(seconds: Double)
    func goForwardVideo(seconds: Double)
}

final class CustomView: UIView {
    
    var delegate: TimeDelegate?
    var player: AVPlayer?
    var timeObserverToken: Any?
    
    @IBOutlet weak var slider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        delegate?.setVideoTime(result: Float(sender.value))
    }
    
    @IBAction func playAndPauseButtonAction(_ sender: Any) {
        if let player = player {
            if player.rate == 0 {
                player.play()
            } else {
                player.pause()
            }
        }
    }
    @IBAction func goForwardButton(_ sender: Any) {
        delegate?.goForwardVideo(seconds: 5)
        
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        delegate?.gobackVideo(seconds: 5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    deinit {
        if let token = timeObserverToken {
            player?.removeTimeObserver(token)
            timeObserverToken = nil
        }
    }
    
    private func configureView() {
        guard let view = self.loadFromNib(nibName: "CustomView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func setupPlayer(player: AVPlayer) {
        self.player = player
        addPeriodicTimeObserver()
    }
    
    private func addPeriodicTimeObserver() {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 1, preferredTimescale: timeScale)
        
        timeObserverToken = player?.addPeriodicTimeObserver(forInterval: time, queue: .main) { [weak self] time in
            guard let self = self else { return }
            let currentTime = CMTimeGetSeconds(time)
            let duration = CMTimeGetSeconds(self.player?.currentItem?.duration ?? CMTime.zero)
            let progress = Float(currentTime / duration)
            self.slider.value = progress
        }
    }
    
}

