////
////  RecentPersonsController.swift
////  EPAM_iOS_School_Practice_2_Star_Wars
////
////  Created by Maxim on 14.02.2020.
////  Copyright © 2020 Maksim Svyatov. All rights reserved.
////
//
import UIKit
import RealmSwift

class RecentPersonsController: UITableViewController {
    
    var personService: PersonServiceProtocol = PersonService()
    var recentItems: Results<Person>!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(recentItems ?? "0")
//        RecentPersonsController.setEditing(false, animated: true)
//        RecentPersonsController.reloadData()
        //getAllPersons()
        // Do any additional setup after loading the view.
        //showRecentItems()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print(recentItems ?? "0")
        //showRecentItems()
    }

    func showRecentItems() {
        recentItems = personService.getAllPersons()
        //self.tableView.setEditing(false, animated: true)
        self.tableView.reloadData()
    }
    
    //self.items = people.all
//    self.personServise.save(personList: people.all)
//    self.tableView.reloadData()
//   var recentItems = PersonService.getAllPersons()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(recentItems?.count)
        return recentItems?.count ?? 1
        
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if recentItems?.count == nil {
                let cell = tableView.dequeueReusableCell(withIdentifier: "recentPersonsCell", for: indexPath)
                //let item = recentItems[indexPath.row]
                    cell.textLabel?.text = "No recents"
                return cell
                
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentPersonsCell", for: indexPath)
            let item = recentItems?[indexPath.row]
            cell.textLabel?.text = item?.name
            return cell
           
        }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //personService.delete() // Удаление элеента из базы данных
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.reloadData()
        }
    }
    
//       override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//           //selectedItem = items[indexPath.row]
//
//           return indexPath
//       }

//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let destinationVC = segue.destination as? DetailViewController else {
//                return
//          }
//            destinationVC.data = selectedItem
//        }
    }




