//
//  DataSourceController + NavBar.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 2/12/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit



extension DataSourceController{
    
    
    func setUpTitleBarItem(){
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
    }
    func setUpLeftBarItems(){
        
        let titleView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleView.contentMode = .scaleAspectFit
        navigationItem.titleView =  titleView
        
    }
    
    func setupRightNavItems(){
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
        
    }
}
