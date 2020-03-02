//
//  SearchService.swift
//  EPAM_iOS_School_Practice_2_Star_Wars
//
//  Created by Maxim on 27.02.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//
//import UIKit
import Foundation
import Alamofire

protocol SearchServiceProtocol {
    func searchPeople(for name: String, completion: @escaping ((People?, Error?)->()))
   // func showAlert()
}

class SearchService: SearchServiceProtocol {
   
    func searchPeople(for name: String, completion: @escaping ((People?, Error?) -> ())) {
        let url = "https://swapi.co/api/people"
         let parameters: [String: String] = ["search": name]
         AF.request(url, parameters: parameters)
           .validate()
           .responseDecodable(of: People.self) { response in
               if let error = response.error {
                //print(response.error)
                   //showAlert()
                   //print("Error: \(error.localizedDescription)")
                   completion (nil, error)
                   return
               }
                 
                 
//            guard let error = response.error else {
//                //showAlert()
////               print("Error: \(error.localizedDescription)")
//              completion (nil, nil)
//                return
//            }
//
//            print(error)
//            completion (nil, error)
            

            
            //            guard let error = response.error else {
//                   //showAlert()
//                   //print("Error: \(error.localizedDescription) 222222")
//                   completion (nil, nil)
//                   return
//               }
//
//            completion (nil, error)
            
    guard let people = response.value else {
        completion (nil, nil)
        return }
            
    completion (people, nil)
         
        }
    }
}
