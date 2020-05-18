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
}

class PersonService: PersonServiceProtocol {
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    func save(person: Person) {
        let predicate = NSPredicate(format: "name = %@", person.name)
        let list = realm.objects(Person.self).filter(predicate)
        if list.isEmpty {
            do {
                try realm.write {
                    realm.add(person)
                }
            } catch {
                return
            }
        }
    }
    
    func save(personList: [Person]) {
        personList.forEach { save(person: $0) }
    }
    
    func delete(person: Person) {
        do {
            try realm.write {
                realm.delete(person)
            }
        } catch {
            return
        }
    }
    
    func getAllPersons() -> Results<Person> {
        let list = realm.objects(Person.self)
        return list
    }
}
