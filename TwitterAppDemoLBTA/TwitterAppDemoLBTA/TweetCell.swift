//
//  TweetCell.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 2/13/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let pri = UIImageView()
        pri.image =  #imageLiteral(resourceName: "abdoulaye")
        pri.layer.cornerRadius = 5
        pri.layer.masksToBounds = true
        pri.backgroundColor = .red
        return pri
        
    }()
    
    
    override func setupViews(){
        super.setupViews()
        backgroundColor = .red
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
    
    
    
    
    
    
    
}
