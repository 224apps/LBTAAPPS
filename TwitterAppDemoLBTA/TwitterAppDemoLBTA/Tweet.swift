//
//  Tweet.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 9/15/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON


struct Tweet: JSONDecodable {
    
    let  user : User
    let  message: String
    
    init(json:JSON) {
         let userJSON = json["users"]
         self.user = User(json: userJSON)
         self.message = json["message"].stringValue
    }
    
}
