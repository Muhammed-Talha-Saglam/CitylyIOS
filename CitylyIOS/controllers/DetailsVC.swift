//
//  DetailsVC.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    var city: CityInfo?

    @IBOutlet var cityName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = city?.name
    }
    

}
