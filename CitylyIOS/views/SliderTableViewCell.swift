//
//  SliderTableViewCell.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    @IBOutlet var option1: UILabel!
    @IBOutlet var option2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func update(question: Question) {
        option1.text = question.option1
        option2.text = question.option2
    }

}
