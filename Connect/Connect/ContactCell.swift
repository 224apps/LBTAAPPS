//
//  ContactCell.swift
//  Connect
//
//  Created by Abdoulaye Diallo on 11/26/17.
//  Copyright © 2017 224apps. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell{
    
    
    var link: ViewController?
    
   
    @objc func handleMarkAsFavorite(){
        print(" adding the favorite")
         link?.someMethodIwantToCall(cell: self)
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let starButton = UIButton(type: .system)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.setImage(#imageLiteral(resourceName: "fav_star"), for: UIControlState.normal)
        starButton.tintColor = .green
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: UIControlEvents.touchUpInside)
         accessoryView = starButton
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
