//
//  CityListTableViewCell.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 25.01.2022.
//

import UIKit

class CityListTableViewCell: UITableViewCell {


    
    static let identifier = "CityListTableViewCell"
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityScore: UILabel!
    @IBOutlet var summary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(urbanInfo: UrbanAreaInfo) {

        cityName.text = urbanInfo.fullName
        if let score = urbanInfo.scores?.teleportCityScore {
            cityScore.text = "\(Int(score))"
        }
        if let desc = urbanInfo.scores?.summary {
//            summary.text = "\(desc)"
            summary.attributedText = desc.html2Attributed
        }

        guard urbanInfo.imgUrl != "" else { return }
        
        let url = URL(string: urbanInfo.imgUrl)!
               
               DispatchQueue.global().async {
                   do {
                       let data = try Data(contentsOf: url)
                       DispatchQueue.main.sync {
                           self.imgView.image = UIImage(data: data)
                       }
                   } catch {
                    
                }
        }

    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
