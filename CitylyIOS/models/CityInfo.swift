//
//  CityInfo.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import Foundation
import Alamofire

class CityInfo: Codable {
    var href: String = ""
    var imgUrl: String = ""
    var name: String = ""
    var desc: String = ""
    var point: Double = 99

    func downLoadCityInfo(completed: DownloadComplete) {
       let url = "\(BASE_URL)\(PATH_URBAN_AREAS)"
       AF.request(url, method: .get).responseDecodable(of: UrbanInfo.self) { res in
           do {
               if let data = res.data {
                   let json = try JSONDecoder().decode(UrbanInfo.self, from: data)
               }
           } catch { }

       }
   }

}


