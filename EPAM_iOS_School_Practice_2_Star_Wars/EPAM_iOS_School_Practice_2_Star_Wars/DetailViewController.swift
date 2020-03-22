//
//  DetailViewController.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 18.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightTitleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massTitleLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var birthYearTitleLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var data: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        guard let data = data else { return }
        
        nameLabel.text = data.name
        
        birthYearTitleLabel.text = "Birth Year"
        birthYearLabel.text = data.birthYear
        
        heightTitleLabel.text = "Height"
        heightLabel.text = data.height
        
        massTitleLabel.text = "Mass"
        massLabel.text = data.mass
    }
}
