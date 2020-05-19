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
    
    var people: [Person] = []
    var selectedItem: Person?
    var searchService: SearchServiceProtocol = SearchService()
    var personServise: PersonServiceProtocol = PersonService()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = people[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = people[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else {
            return
        }
        
        destinationVC.data = selectedItem.self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let person = searchBar.text else { return }
        searchService.searchPeople(for: person) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let people):
                guard let people = people else {
                    return
                }
                self.people = people.all
                self.personServise.save(personList: people.all)
                self.tableView.reloadData()
                if self.people.count == 0 {
                    let alert = UIAlertController(title: "Oops...", message: "No one was found(", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    self.searchBar.text = ""
                }
            case .failure(let error):
                let alert = UIAlertController(title: "Oops...", message: "Error: \(error.localizedDescription)", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.searchBar.text = ""
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        people.removeAll()
        tableView.reloadData()
    }
}
