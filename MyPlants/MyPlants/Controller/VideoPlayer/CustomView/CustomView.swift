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
//    var activityIndicator: UIActivityIndicatorView {
//        let activity = UIActivityIndicatorView(style: .whiteLarge)
//        activity.translatesAutoresizingMaskIntoConstraints = false
//        return activity
//    }

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.configureView()
        }
     
    @IBAction func sliderAction(_ sender: UISlider) {
//        print("value - \(sender.value)")
        delegate?.setVideoTime(result: Float(sender.value))
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

