//
//  UrbanAreaList.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import Foundation
import Alamofire

class UrbanAreaList {
    var _urbanArealist: [UaItem]!
    
    var urbanArealist: [UaItem] {
        get {
            if _urbanArealist == nil {
                _urbanArealist = [UaItem]()
            }
            return _urbanArealist
        }
        
        set {
            _urbanArealist = newValue
        }
    }

    func downLoadAllUrbanAreaName(completed: DownloadComplete) {
        let url = "\(BASE_URL)\(PATH_URBAN_AREAS)"
        AF.request(url, method: .get).responseDecodable(of: UrbanInfo.self) { res in
            do {
                if let data = res.data {
                    let json = try JSONDecoder().decode(UrbanInfo.self, from: data)
                    self.urbanArealist = json.links.uaItem
                    print(self.urbanArealist)
                }
            } catch { }

        }
    }

}

// MARK: - UrbanInfo
struct UrbanInfo: Codable {
    let links: Links
    let count: Int

    enum CodingKeys: String, CodingKey {
        case links = "_links"
        case count
    }
}

// MARK: - Links
struct Links: Codable {
    let uaItem: [UaItem]

    enum CodingKeys: String, CodingKey {
        case uaItem = "ua:item"
    }
}

// MARK: - UaItem
struct UaItem: Codable {
    let href: String
    let name: String
}
