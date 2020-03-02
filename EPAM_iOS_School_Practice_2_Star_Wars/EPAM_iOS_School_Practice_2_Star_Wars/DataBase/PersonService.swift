//
//  PersonService.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 28.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import Foundation
import RealmSwift

protocol PersonServiceProtocol {
    func save(person: Person)
    func save(personList: [Person])
    func delete(person: Person)
    func getAllPersons() -> Results<Person>
    //var list: Results<Person>! { get }
}

class PersonService: PersonServiceProtocol {
    
    //var list: Results<Person>!
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    //let list: Results<Person>! = Results<Person>()
    
    func save(person: Person) {
        let predicate = NSPredicate(format: "name = %@", person.name)
        let list = realm.objects(Person.self).filter(predicate)
        if list.isEmpty {
            try! realm.write {
                realm.add(person)
            }
        }
    }
    
    func save(personList: [Person]) {
        for person in personList {
            save(person: person)
            //print(personList.count)
        }
    }
    
    func delete(person: Person) {
        try! realm.write {
            realm.delete(person)
        }
    }
    
    func getAllPersons() -> Results<Person> {
        let list = realm.objects(Person.self)

          //print(list)
          //print(list.count)
        return list
    }
}
