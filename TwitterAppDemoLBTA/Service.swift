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
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    
    static let sharedInstance = Service()
     let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    func fetchHomeFeed(completionHandler: @escaping (DataSource?, Error?)->()) {
            //start our json fetch
            let request: APIRequest<DataSource,  JSONError> = tron.request("/twitter/home")
            request.perform(withSuccess: { (datasource) in
                completionHandler(datasource, nil)
            }) { (err) in
                let err = err as? APIError<JSONError>
               // err?.response?.statusCode
                 completionHandler(nil, err)
        }
    }
    
    
}
