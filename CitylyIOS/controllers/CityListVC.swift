//
//  CityListVC.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class CitylistVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet var cityListTableView: UITableView!
    
    var urbanAreaList = [UrbanAreaInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cityListTableView.delegate = self
        cityListTableView.dataSource = self
        

        let urbanList = UrbanAreaList.urbanArealist.prefix(UrbanAreaList.lastIndex-1)
        urbanList.forEach { urbanArea in
            let urbanAreaInfo = UrbanAreaInfo()
            urbanAreaInfo.href = urbanArea.href
            urbanAreaInfo.fullName = urbanArea.name
            urbanAreaInfo.downLoadSalaryInfo()
            urbanAreaInfo.downLoadScoresInfo()
            urbanAreaInfo.downLoadCityImg() {
                DispatchQueue.main.async {
                    self.urbanAreaList.append(urbanAreaInfo)
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        urbanAreaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTableViewCell.identifier, for: indexPath) as! CityListTableViewCell
        
        cell.configure(urbanInfo: urbanAreaList[indexPath.row])
        
        return cell
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsVC {
            if let city = sender as? CityInfo {
                destination.city = city
            }
        }
    }
    
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        cityListTableView.reloadData()

    }
    @IBAction func btnMore(_ sender: UIButton) {
        let lastIndex = UrbanAreaList.lastIndex
        for i in lastIndex..<(lastIndex+10) {
            let urbanArea =  UrbanAreaList.urbanArealist[i]
            let urbanAreaInfo = UrbanAreaInfo()
            urbanAreaInfo.href = urbanArea.href
            urbanAreaInfo.fullName = urbanArea.name
            urbanAreaInfo.downLoadCityImg() {
                DispatchQueue.main.async {
                    self.urbanAreaList.append(urbanAreaInfo)
                }
            }
        }
        UrbanAreaList.lastIndex = lastIndex + 10
    }
    
}
