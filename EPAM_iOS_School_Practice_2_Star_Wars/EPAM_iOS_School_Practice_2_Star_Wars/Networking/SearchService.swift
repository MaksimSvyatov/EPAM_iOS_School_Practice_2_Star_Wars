//
//  SearchService.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 27.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchServiceProtocol {
    func searchPeople(for name: String, completion: @escaping ((People?, Error?)->()))
}

class SearchService: SearchServiceProtocol {
   
    func searchPeople(for name: String, completion: @escaping ((People?, Error?) -> ())) {
        let url = "https://swapi.co/api/people"
         let parameters: [String: String] = ["search": name]
         AF.request(url, parameters: parameters)
           .validate()
           .responseDecodable(of: People.self) { response in
               if let error = response.error {
                print("Error: \(error.localizedDescription)")
                   completion (nil, error)
                   return
               }
            
    guard let people = response.value else {
        completion (nil, nil)
        return }
            
    completion (people, nil)
         
        }
    }
}
