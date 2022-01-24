//
//  CityListVC.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import UIKit

class CitylistVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    
    @IBOutlet var cityListcollectionView: UICollectionView!
    
    var urbanAreaList = [UrbanAreaInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cityListcollectionView.delegate = self
        cityListcollectionView.dataSource = self
        
        cityListcollectionView.register(CityListCollectionViewCell.nib(), forCellWithReuseIdentifier: CityListCollectionViewCell.identifier)

        let urbanList = UrbanAreaList.urbanArealist.prefix(10)
        urbanList.forEach { urbanArea in
            let urbanAreaInfo = UrbanAreaInfo()
            urbanAreaInfo.href = urbanArea.href
            urbanAreaInfo.fullName = urbanArea.name
            urbanAreaInfo.downLoadCityImg()
            urbanAreaList.append(urbanAreaInfo)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        urbanAreaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityListCollectionViewCell.identifier, for: indexPath) as! CityListCollectionViewCell
        
        let urbanInfo = urbanAreaList[indexPath.row]
        cell.configure(urbanInfo: urbanInfo)
    
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
        cityListcollectionView.reloadData()

    }
    
}
