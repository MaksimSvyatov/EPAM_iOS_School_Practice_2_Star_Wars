//
//  People.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 17.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

struct People: Decodable {
    let count: Int
    let all: [Person]
      
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
