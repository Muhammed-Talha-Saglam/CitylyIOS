//
//  CityListTableViewCell.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class CityListTableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var point: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(city: CityInfo) {
        name.text = city.name
        desc.text = city.desc
        point.text = "\(city.point)"
        
        let url = URL(string: city.imgUrl)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.img.image = UIImage(data: data)
                }
            } catch {
                
            }
        }
    
    }
}
