//
//  UrbanAreaInfo.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import Foundation
import Alamofire

class UrbanAreaInfo {
    var continent: String = ""
    var fullName: String = ""
    var href: String = ""
//    var salaries: Salaries? = null,
//    var scores: Scores? = null,
    var imgUrl: String = ""
    var desc: String = ""
    var result: Double = 0.0
    
    
    func downLoadCityImg() {
       let url = "\(href)images/"
       AF.request(url, method: .get).responseDecodable(of: Photos.self) { res in
           do {
               if let data = res.data {
                   let json = try JSONDecoder().decode(Photos.self, from: data)
                   self.imgUrl = json.photos.first?.image.mobile ?? ""
                   
                   print(self.imgUrl)
               }
           } catch { }

       }
   }

}

struct Photos: Codable {
    let photos: [Image]
}

struct Image: Codable {
    let image: Mobile
}

struct Mobile: Codable {
    let mobile: String
}

