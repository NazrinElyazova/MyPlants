//
//  TutorialsCell.swift
//  MyPlants
//
//  Created by Nazrin on 03.04.24.
//

import UIKit

class TutorialsCell: UICollectionViewCell {
    
    var item = TutorialViewModel()
    var delegate: GoToControllerProtocol?
    
    @IBOutlet weak var table: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.table.register(UINib(nibName: "\(TutorialSectionCell.self)", bundle: nil), forCellReuseIdentifier: "\(TutorialSectionCell.self)")
        
        table.delegate = self
        table.dataSource = self
    }

}

extension TutorialsCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TutorialSectionCell.self)") as! TutorialSectionCell
        
        let option = item.model[indexPath.row]
        cell.ageLabel.text = option.age
        cell.tutorialImage.image = option.image
        cell.waterYourPlant.text = option.water
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.goToVideo()
    }
}
