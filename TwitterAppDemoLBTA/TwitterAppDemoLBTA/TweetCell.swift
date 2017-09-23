//
//  TweetCell.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 2/13/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        
        didSet{
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let username = "  \(tweet.user.username) \n "
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4.0
            let range = NSMakeRange(0, attributedText.string.characters.count)
            
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            
            attributedText.append(NSAttributedString(string: username, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.black]))
            
            messageTextView.attributedText = attributedText
            
            
        }
    }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample Text"
        tv.backgroundColor = .clear
        return  tv
    }()
    
    let profileImageView: UIImageView = {
        let pri = UIImageView()
        pri.image =  #imageLiteral(resourceName: "abdoulaye")
        pri.layer.cornerRadius = 5
        pri.layer.masksToBounds = true
        return pri
        
    }()
    
    let replyButton: UIButton = {
        let rb = UIButton(type: .system)
        rb.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return rb
    }()
    
    let retweetButton : UIButton = {
        let rt = UIButton(type: .system)
        rt.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return rt
    }()
    
    let likeButton : UIButton = {
        let lb = UIButton(type: .system)
        lb.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return lb
    }()
    
    let directMessageButton : UIButton = {
        let dm = UIButton(type: .system)
        dm.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return dm
    }()
    
    
    
    
    override func setupViews(){
        super.setupViews()
        

        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4 , leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupBottomButtons()
    }
    
     fileprivate func setupBottomButtons()  {
        
         let replyContainerView = UIView()
        
         let retweetContainerView = UIView()
        
         let likeContainerView = UIView()
        
         let directMessageContainerView = UIView()
        
    let stackView = UIStackView(arrangedSubviews: [replyContainerView, retweetContainerView, likeContainerView, directMessageContainerView] )
        
         stackView.axis = .horizontal
        stackView.distribution = .fillEqually
         addSubview(stackView)
        
        stackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        
         replyButton.anchor(replyContainerView.topAnchor, left: replyContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetContainerView.topAnchor, left: retweetContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeContainerView.topAnchor, left: likeContainerView.leftAnchor, bottom: nil, right:nil , topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
        
       
    }
    
    
    
    
    
    
    
}
