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
    var salaries: Salary? = nil
    var scores: Scores? = nil
    var imgUrl: String = ""
    
    
    func downLoadCityImg(completion: @escaping ()-> Void) {
       let url = "\(href)images/"
       AF.request(url, method: .get).responseDecodable(of: Photos.self) { res in
           do {
               if let data = res.data {
                   let json = try JSONDecoder().decode(Photos.self, from: data)
                   self.imgUrl = json.photos.first?.image.mobile ?? ""
                   completion()
               }
           } catch { }

       }
   }
    
    func downLoadSalaryInfo() {
        let url = "\(href)salaries/"
        AF.request(url, method: .get).responseDecodable(of: Salary.self) { res in
            do {
                if let data = res.data {
                    let json = try JSONDecoder().decode(Salary.self, from: data)
                    self.salaries = json
                }
            } catch { }
        }
    }
    
    func downLoadScoresInfo() {
        let url = "\(href)scores/"
        AF.request(url, method: .get).responseDecodable(of: Scores.self) { res in
            do {
                if let data = res.data {
                    let json = try JSONDecoder().decode(Scores.self, from: data)
                    self.scores = json
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

// MARK: - Salary
struct Salary: Codable {
    let salaries: [SalaryElement]
}

// MARK: - SalaryElement
struct SalaryElement: Codable {
    let job: Job
    let salaryPercentiles: SalaryPercentiles

    enum CodingKeys: String, CodingKey {
        case job
        case salaryPercentiles = "salary_percentiles"
    }
}

// MARK: - Job
struct Job: Codable {
    let id, title: String
}

// MARK: - SalaryPercentiles
struct SalaryPercentiles: Codable {
    let percentile25, percentile50, percentile75: Double

    enum CodingKeys: String, CodingKey {
        case percentile25 = "percentile_25"
        case percentile50 = "percentile_50"
        case percentile75 = "percentile_75"
    }
}


// MARK: - Scores
struct Scores: Codable {
    let categories: [Category]
    let summary: String
    let teleportCityScore: Double

    enum CodingKeys: String, CodingKey {
        case categories, summary
        case teleportCityScore = "teleport_city_score"
    }
}

// MARK: - Category
struct Category: Codable {
    let color, name: String
    let scoreOutOf10: Double

    enum CodingKeys: String, CodingKey {
        case color, name
        case scoreOutOf10 = "score_out_of_10"
    }
}
