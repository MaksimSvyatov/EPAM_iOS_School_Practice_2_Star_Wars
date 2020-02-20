//
//  Person.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 17.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

struct Person: Decodable {
    let name: String
    let height: String
    let mass: String
    let birthYear: String
    let gender: String
      
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case birthYear = "birth_year"
        case gender
    }
}

extension Person: Visualized {
    var titleLabelText: String {
        name
    }
      
    var item1: (label: String, value: String) {
        ("HEIGHT", height)
    }
      
    var item2: (label: String, value: String) {
        ("MASS", mass)
    }
      
    var item3: (label: String, value: String) {
        ("BIRTH YEAR", birthYear)
    }
}
