//
//  Reviews.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/23/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import Foundation


struct Reviews : Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable{
    let entry: [Entry]
}

struct Entry: Decodable {
    let title: Label
    let content: Label
    let author: Author
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}
struct Label:Decodable {
    let label : String
}
