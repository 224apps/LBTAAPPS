//
//  Feed.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    
    let  title:  String
    let results: [FeedResult]
}
