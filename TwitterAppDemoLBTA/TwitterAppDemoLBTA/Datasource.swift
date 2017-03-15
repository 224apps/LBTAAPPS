//
//  HomeDatasource.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/12/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import LBTAComponents


class DataSource: Datasource {
    
    
    let users:[User] = {
        
        let abdoulaye =  User(name:"Abdoulaye", username: "@abdoul", bioText: "This is the bio of abdoulaye.Abdoulaye is on his way to become a senior developer in  both ioS and Android.", profileImage: #imageLiteral(resourceName: "abdoulaye") )
        
        let raywenderlich = User(name: "Ray Wenderlich", username: "@raywenderlich", bioText: " This is the bio of abdoulaye.Abdoulaye is on his way to become a senior developer in  both ioS and Android.", profileImage: #imageLiteral(resourceName: "raywenderlich"))
        let lensafrica = User(name: "LensAfrica", username: "@Lensafrica", bioText: "Here are the ten African Countries With The Most Beautiful Women, 54 nations over 1 billion people, but who harbors the most gorgeous girls.Here are the ten African Countries With The Most Beautiful Women, 54 nations over 1 billion people, but who harbors the most gorgeous girls.Here are the ten African Countries With The Most Beautiful Women, 54 nations over 1 billion people, but who harbors the most gorgeous girls.Here are the ten African Countries With The Most Beautiful Women, 54 nations over 1 billion people, but who harbors the most gorgeous girls.Here are the ten African Countries With The Most Beautiful Women, 54 nations over 1 billion people, but who harbors the most gorgeous girls.", profileImage: #imageLiteral(resourceName: "beauty"))
         return [ abdoulaye, raywenderlich, lensafrica]
        
        
        
    }()
    
    
     let tweets = ["Tweet 1", "Tweet 2", "Tweet 3"]
    
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
        return users[indexPath.item]
    }
    
}

