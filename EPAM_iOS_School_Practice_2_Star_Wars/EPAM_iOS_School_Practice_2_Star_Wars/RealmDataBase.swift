//
//  RealmDataBase.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 23.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import Foundation
import RealmSwift

class recentRequests: Object {
    @objc dynamic var name = ""
    @objc dynamic var height = ""
    @objc dynamic var mass = ""
    @objc dynamic var birthYear = ""
    @objc dynamic var gender = ""


//    @objc dynamic var titleLabelText = "" //{ get }
//    @objc dynamic var item1 = "" //{ get }
//    @objc dynamic var item2 = "" //{ get }
//    @objc dynamic var item3 = "" //{ get }
}
