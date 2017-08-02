//
//  Message.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 8/1/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class Message: NSObject {
    var  fromId: String?
    var  text: String?
    var timestamp: NSNumber?
    var toId: String?
    
    init(dictionary: [String: Any]) {
        self.fromId = dictionary["fromId"] as? String
        self.text = dictionary["text"] as? String
        self.toId = dictionary["toId"] as? String
        self.timestamp = dictionary["timestamp"] as? NSNumber
    }

}
