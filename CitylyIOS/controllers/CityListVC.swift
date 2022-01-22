//
//  CityListVC.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class CitylistVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var cityListTableView: UITableView!
    
    var cityList = [CityInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        cityListTableView.dataSource = self
        cityListTableView.delegate = self

        for i in 0..<10 {
            let city = CityInfo(imgUrl: "https://media.istockphoto.com/photos/technology-network-background-picture-id1317167274", name: "City \(i)" ,desc: "Some Description goes here for city \(i).", point: 99.0)
            cityList.append(city)
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CitylistCell", for: indexPath) as? CityListTableViewCell {
            
            cell.update(city: cityList[indexPath.row])
            return cell
        } else {
            return CityListTableViewCell()
        }

    }
    
}
