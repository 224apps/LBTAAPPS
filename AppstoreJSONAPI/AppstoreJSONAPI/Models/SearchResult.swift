//
//  SearchResult.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/20/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
