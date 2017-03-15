//
//  Cells.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/12/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import LBTAComponents




  let twitterColorBlue = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {
    
    let titleLabel:UILabel = {
        
        let tl = UILabel()
        tl.text = "Show More.."
         tl.textColor = twitterColorBlue
        return tl
    }()
    
    override func setupViews() {
         backgroundColor = .white
        super.setupViews()
        addSubview(titleLabel)
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    
}

class UserHeader: DatasourceCell {
    
    
    let titleLabel:UILabel = {
        
        let tl = UILabel()
            tl.text = "WHO TO FOLLOW"
         return tl
    }()
    
    override func setupViews() {
        super.setupViews()
         backgroundColor = .white
         addSubview(titleLabel)
         titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}


class UserCell: DatasourceCell {
    override var datasourceItem: Any?{
        didSet{
            guard  let user = datasourceItem as?  User else { return }
             nameLabel.text = user.name
             usernameLabel.text = user.username
             bioTextView.text =  user.bioText
             profileImageView.image = user.profileImage
        }
    }
            
    
    let bioTextView: UITextView = {
         let bt = UITextView()
         bt.text = "Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius."
        bt.font = UIFont.systemFont(ofSize: 12)
         return bt
    }()
    
    let nameLabel:  UILabel = {
        let nl = UILabel()
          nl.font = UIFont.boldSystemFont(ofSize: 16)
         nl.text = "Abdoulaye"
        return nl
    }()
    
    let profileImageView: UIImageView = {
         let pri = UIImageView()
         pri.image =  #imageLiteral(resourceName: "abdoulaye")
         pri.layer.cornerRadius = 5
         pri.layer.masksToBounds = true
         pri.backgroundColor = .red
         return pri
        
    }()
    
    let usernameLabel: UILabel = {
         let ul = UILabel()
         ul.text = "@abdoulaye"
         ul.font = UIFont.systemFont(ofSize: 14)
         ul.textColor = UIColor(r: 130, g: 130, b: 130)
         return ul
    }()
    

    let followButton: UIButton = {
        // let twitterColorBlue = UIColor(r: 61, g: 167, b: 244)
        let fb = UIButton()
            fb.layer.cornerRadius = 5
            fb.layer.borderColor = twitterColorBlue.cgColor
            fb.layer.borderWidth = 1
            fb.setTitle("Follow", for: .normal)
            fb.setTitleColor(twitterColorBlue, for: .normal)
             fb.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
            fb.imageView?.contentMode = .scaleAspectFit
            fb.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
         return fb
    }()
    
    
    
    
    
    override func setupViews() {
        super.setupViews()
         backgroundColor = .white
        
        separatorLineView.isHidden = false
         separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
         addSubview(profileImageView)
         addSubview(nameLabel)
         addSubview(usernameLabel)
         addSubview(bioTextView)
         addSubview(followButton)
        
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor , bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
   
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
       
         bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
    }
    
}
