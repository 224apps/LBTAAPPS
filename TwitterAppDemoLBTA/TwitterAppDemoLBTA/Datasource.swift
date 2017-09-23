//
//  HomeDatasource.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/12/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import LBTAComponents
import SwiftyJSON
import TRON

class DataSource: Datasource , JSONDecodable {
    
    let users: [User]
     var tweets = [Tweet]()
    
    required init(json: JSON) throws {
        
        let userJSONArray = json["users"].array
        self.users = userJSONArray!.map{ return User(json: $0) }
        let tweetJSONArray = json["tweets"].array
        self.tweets = tweetJSONArray!.map{ return Tweet(json:$0)}
        
    }


    override func footerClasses() -> [DatasourceCell.Type]? {
        return [ UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return  [ UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ UserCell.self, TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1{
            return 1
        }
        return users.count
    }
    override func numberOfSections() -> Int {
        return 2
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
             return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
}

