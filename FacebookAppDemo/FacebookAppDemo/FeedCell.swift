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
        setUpViews()
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
    
    func setUpViews(){
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addConstraintsWithFormat(  format:"H:|-8-[v0(44)]-8-[v1]|" , views:profileImageView, nameLabel)
        addConstraintsWithFormat(  format:"V:|[v0]|" , views:nameLabel)
        addConstraintsWithFormat( format:"V:|-8-[v0(44)]|" , views:profileImageView)
        
    }
    
}


extension UIView {
    
    func addConstraintsWithFormat(  format:String ,  views:UIView...){
        
        var dict = [String:UIView]()
        for (index,view) in  views.enumerated() {
            let key = "v\(index)"
            dict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        )
        
    }
    
    
    
    
}
