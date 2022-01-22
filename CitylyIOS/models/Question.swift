//
//  Question.swift
//  CitylyIOS
//
//  Created by Muhammed Talha Sağlam on 22.01.2022.
//

import Foundation


struct Question {
    let option1: String
    let option2: String
    init(_ option1: String,_ option2: String) {
        self.option1 = option1
        self.option2 = option2
    }
}

let questions = [
    Question("Cost of living","Internet Accessibility"),
            Question("Cost of living","Safety"),
            Question("Cost of living","Leisure & Culture"),
            Question("Cost of living","Tolerance"),
            Question("Internet Accessibility","Safety"),
            Question("Internet Accessibility","Leisure & Culture"),
            Question("Internet Accessibility","Tolerance"),
            Question("Safety","Leisure & Culture"),
            Question("Safety","Tolerance"),
            Question("Leisure & Culture","Tolerance"),
]
