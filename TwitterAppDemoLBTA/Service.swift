//
//  Service.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 9/16/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    static let sharedInstance = Service()
     let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    func fetchHomeFeed(completionHandler: @escaping (DataSource)->()) {
            //start our json fetch
            let request: APIRequest<DataSource,  DataSourceController.JSONError> = tron.request("/twitter/home")
            request.perform(withSuccess: { (datasource) in
                completionHandler(datasource)
            }) { (err) in
                print("Failed to fetch json...", err)
        }
    }
}
