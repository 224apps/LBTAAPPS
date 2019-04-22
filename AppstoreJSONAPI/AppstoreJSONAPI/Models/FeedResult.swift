//
//  FeedResult.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}
