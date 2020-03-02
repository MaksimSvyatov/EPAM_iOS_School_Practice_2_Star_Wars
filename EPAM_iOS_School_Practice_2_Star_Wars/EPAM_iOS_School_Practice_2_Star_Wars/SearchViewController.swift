//
//  SearchViewController.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 15.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class SearchViewController: UITableViewController {
    
//    //let realm = try! Realm()
//
//    lazy var realm: Realm = {
//        return try! Realm()
//    }()
    
    var items: [Visualized] = []
    var people: [Person] = []
    var selectedItem: Visualized?
    var searchService: SearchServiceProtocol = SearchService()
    var personServise: PersonServiceProtocol = PersonService()
    
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
    
    //guard let realmSelectedItem = selectedItem as? Object else { return }
//       try! realm.write {
//        realm.add((selectedItem as? Object)!)
//       }
    
    //tableView.reloadData()
    
    
    
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
        searchService.searchPeople(for: person) { [weak self] (people, error) in
            guard let self = self else { return }
            
            guard let people = people else {
                return
            }
            self.items = people.all
            self.personServise.save(personList: people.all)
            self.tableView.reloadData()
            if self.items.count == 0 {
                let alert = UIAlertController(title: "Oops...", message: "No one was found(", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.searchBar.text = ""
            }
            
            
            //guard let error = error else { return }
//                       if error != nil {
////                       print("Error: \(error.localizedDescription) 11111")
//                        let alert = UIAlertController(title: "Oops...", message: "Something goes wrong. Error: \(error!.localizedDescription)", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
//                    alert.addAction(action)
//                    self.present(alert, animated: true, completion: nil)
//                    self.searchBar.text = ""
//            
//            
//            }
//            func showAlert() {
//                   let alert = UIAlertController(title: "Oops...", message: "Something goes wrong. Error: \(error?.localizedDescription ?? "Unknown error")", preferredStyle: .alert)
//                           let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
//                           alert.addAction(action)
//                           self.present(alert, animated: true, completion: nil)
//                           self.searchBar.text = ""
//                       }
               }
               
            
//            guard let error = error else { return }
//            if error != nil {
//            print("Error: \(error.localizedDescription) 11111")
//            }
//                let alert = UIAlertController(title: "Oops...", message: "Something goes wrong. Error: \(error?.localizedDescription ?? "Unknown error")", preferredStyle: .alert)
//                let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
//                alert.addAction(action)
//                self.present(alert, animated: true, completion: nil)
//                self.searchBar.text = ""
            
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}
