//
//  Service.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/20/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()){

        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't fetch the data from the API", error)
                completion([], nil)
                return
            }
            guard let data = data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
            } catch let jsonError {
                print("Failed to decode json",jsonError)
                 completion([], jsonError)
            }
        }
        
        
        task.resume()
    }
}
