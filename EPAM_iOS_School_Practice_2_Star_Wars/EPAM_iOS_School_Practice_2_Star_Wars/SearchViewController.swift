//
//  SearchViewController.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 15.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UITableViewController {
    
    var items: [Visualized] = []
    var people: [Person] = []
    var selectedItem: Visualized?
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    override func viewDidLoad() {
       super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.titleLabelText
        return cell
    }
    
   override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
     selectedItem = items[indexPath.row]
     return indexPath
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let destinationVC = segue.destination as? DetailViewController else {
        return
      }
      destinationVC.data = selectedItem
    }
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let person = searchBar.text else { return }
    searchPeople(for: person)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    tableView.reloadData()
  }
}

extension SearchViewController {
    
    func searchPeople(for name: String) {
      let url = "https://swapi.co/api/people"
      let parameters: [String: String] = ["search": name]
      AF.request(url, parameters: parameters)
        .validate()
        .responseDecodable(of: People.self) { response in
            
            if let error = response.error {
                print("Error: \(error.localizedDescription)")
                return
          }
            
          guard let people = response.value else { return }
          self.items = people.all
          self.tableView.reloadData()
          if self.items.count == 0 {
                
            let alert = UIAlertController(title: "Oops...", message: "No one was found(", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            self.searchBar.text = ""
          }
       }
    }
}
