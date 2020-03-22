//
//  Person.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 17.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object, Decodable {
    @objc dynamic var name: String
    @objc dynamic var height: String
    @objc dynamic var mass: String
    @objc dynamic var birthYear: String
    @objc dynamic var gender: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case birthYear = "birth_year"
        case gender
    }
}
