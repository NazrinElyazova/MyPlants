//
//  AddController.swift
//  MyPlants
//
//  Created by Nazrin on 04.04.24.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var galleryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
       
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addToGalleryButton(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        controller.allowsEditing = true
        
        present(controller, animated: true)
    }
}

extension AddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true)
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] {
            galleryImage.image = image as? UIImage
            plusButtonOutlet.isHidden = true
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
