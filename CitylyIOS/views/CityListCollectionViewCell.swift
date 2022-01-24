//
//  CityListCollectionViewCell.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 25.01.2022.
//

import UIKit

class CityListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CityListCollectionViewCell"
    
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
        cityScore.text = "99"
        summary.text = "jkbadslfgn k;a dkgn; ankd;ng nad;g nk;adgn\nadsfkmnladsngf lakndsglkanlk"

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
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
