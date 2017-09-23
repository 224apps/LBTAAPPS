//
//  User.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/13/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable{
    
    
    let name:String
    let username:String
    let bioText: String
    let profileImageURL : String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
         self.bioText = json["bio"].stringValue
        self.profileImageURL = json["profileImageURL"].stringValue
    }
}
