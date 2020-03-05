//
//  RecentPersonsController.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 14.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit
import RealmSwift

class RecentPersonsController: UITableViewController {
    
    var personService: PersonServiceProtocol = PersonService()
    var recentItems: Results<Person>!
    var selectedItem: Person?
    
    @IBOutlet weak var recentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRecentItems()
        showRecentLabelText()
    }

    override func viewDidAppear(_ animated: Bool) {
        showRecentLabelText()
        showRecentItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = recentItems?.count else { return 0 }
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentPersonsCell", for: indexPath)
        let item = recentItems?[indexPath.row]
        cell.textLabel?.text = item?.name
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = recentItems[indexPath.row]
        personService.delete(person: item)
        tableView.deleteRows(at: [indexPath], with: .left)
        showRecentLabelText()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = recentItems[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else {
            return
        }
        
        destinationVC.data = selectedItem  
    }
    
    func showRecentItems() {
        recentItems = personService.getAllPersons()
        self.tableView.reloadData()
    }
    
    func showRecentLabelText() {
        if let isEmpty = recentItems?.isEmpty, isEmpty {
            recentsLabel?.text = "No recents"
        } else {
            recentsLabel?.text = "Recents"
        }
    }
}
