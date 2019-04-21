//
//  Result.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/20/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
    
}
