//
//  DetailViewController.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 18.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var item1TitleLabel: UILabel!
  @IBOutlet weak var item1Label: UILabel!
  @IBOutlet weak var item2TitleLabel: UILabel!
  @IBOutlet weak var item2Label: UILabel!
  @IBOutlet weak var item3TitleLabel: UILabel!
  @IBOutlet weak var item3Label: UILabel!
  
  var data: Visualized?

  override func viewDidLoad() {
      super.viewDidLoad()
      commonInit()
  }
  
  func commonInit() {
      guard let data = data else { return }
       
      titleLabel.text = data.titleLabelText
        
      item1TitleLabel.text = data.item1.label
      item1Label.text = data.item1.value
        
      item2TitleLabel.text = data.item2.label
      item2Label.text = data.item2.value
        
      item3TitleLabel.text = data.item3.label
      item3Label.text = data.item3.value
  }
}
