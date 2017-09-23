//
//  User.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/13/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User{
    
    
    let name:String
    let username:String
    let bioText: String
    let profileImage: UIImage
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
         self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
    }
}
