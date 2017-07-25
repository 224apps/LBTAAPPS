//
//  User.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 7/22/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var email: String?
    var profileImageUrl: String?
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
