//
//  FeedCell.swift
//  FacebookAppDemo
//
//  Created by Abdoulaye Diallo on 3/15/17.
//  Copyright © 2017 Abdoulaye. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let profileImageView: UIImageView = {
        let pv = UIImageView()
        pv.contentMode = .scaleAspectFit
        pv.backgroundColor = .red
        pv.image =  #imageLiteral(resourceName: "abdprofile")
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    let nameLabel : UILabel = {
        let nl =  UILabel()
        nl.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Abdoulaye Diallo", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)])
        attributedText.append(NSAttributedString(string:"\n March 16 • New York City •", attributes:
            [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName:UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
        
        let styleOfParagraph =  NSMutableParagraphStyle()
        styleOfParagraph.lineSpacing = 4
        
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: styleOfParagraph, range: NSMakeRange(0, attributedText.string.characters.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        
        attributedText.append(NSAttributedString(attachment: attachment))
        nl.attributedText = attributedText
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
         imageView.image = #imageLiteral(resourceName: "nyc")
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedCell.buttonForTitle("Like", imageName: "like")
    let commentButton: UIButton = FeedCell.buttonForTitle("Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTitle("Share", imageName: "share")
    
    static func buttonForTitle(_ title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), for: UIControlState())
        
        button.setImage(UIImage(named: imageName), for: UIControlState())
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
//        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: FeedCell.animate, action: <#T##Selector?#>)
//            
//            
//            
//            
//            target: self, action: #selector(FeedCell.animate as (FeedCell) -> () -> ()) as Selector? ))
        
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat("H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat("H:|-12-[v0]|", views: likesCommentsLabel)
        
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views: dividerLineView)
        
        //button constraints
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        
        
        
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton)
        
        addConstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat("V:[v0(44)]|", views: shareButton)
    }
}

extension UIView {
    
    func addConstraintsWithFormat(_ format:String ,  views:UIView...){
        
        var dict = [String:UIView]()
        for (index,view) in  views.enumerated() {            let key = "v\(index)"
            dict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dict))
    }
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}
