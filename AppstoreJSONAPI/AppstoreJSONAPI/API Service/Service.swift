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
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion:@escaping (AppGroup?, Error?) ->())  {
       let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
         fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion:@escaping (AppGroup?, Error?) ->()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
         fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    //Helper functions
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?)->()){
        
        print( " T is a type of :", T.self)
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do{
                let objects =  try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
