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
}

final class CustomView: UIView {
    
    var delegate: TimeDelegate?
    
    var player: AVPlayer?
    var playerDuration: CMTime?
    var playerTimeObserver: Any?
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        delegate?.setVideoTime(result: Float(sender.value))
    }
    
    @IBAction func playButton(_ sender: Any) {

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadFromNib(nibName: "CustomView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    
}

