//
//  Visualized.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 17.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

protocol Visualized {
  var titleLabelText: String { get }
  var item1: (label: String, value: String) { get }
  var item2: (label: String, value: String) { get }
  var item3: (label: String, value: String) { get }
}
