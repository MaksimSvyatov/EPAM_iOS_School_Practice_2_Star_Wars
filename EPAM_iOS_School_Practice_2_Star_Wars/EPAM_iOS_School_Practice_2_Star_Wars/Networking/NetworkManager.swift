//
//  NetworkManager.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 27.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchServiceProtocol {
    func searchPeople(for name: String, completion: @escaping (Result<People?, Error>) -> ())
}

class SearchService: SearchServiceProtocol {
    
    func searchPeople(for name: String, completion: @escaping (Result<People?, Error>) -> ()) {
        let url = "https://swapi.co/api/people"
        let parameters: [String: String] = ["search": name]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: People.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let people = response.value else {
                    return }
                
                completion(.success(people))
                
        }
    }
}
