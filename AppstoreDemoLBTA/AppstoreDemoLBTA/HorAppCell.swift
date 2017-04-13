//
//  HorAppCell.swift
//  AppstoreDemoLBTA
//
//  Created by Abdoulaye Diallo on 4/4/17.
//  Copyright © 2017 DiaryConnect. All rights reserved.
//

import UIKit

class HorAppCell: UICollectionViewCell{
    
    
    
    var app: App? {
        if let name = app?.name {
             nameLabel.text = name
        }
        
         categoryLabel.text = app?.category
        if let  price = app?.price {
            priceLabel.text = "$\(price)"
        } else {
             priceLabel.text = app?.price?.stringValue
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView :UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "facebook")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let nameLabel: UILabel = {
        let nb = UILabel()
        nb.text = " The Social networking site"
        nb.font = .systemFont(ofSize: 13)
        nb.numberOfLines = 2
        nb.textColor = .black
        nb.translatesAutoresizingMaskIntoConstraints = false
        return nb
    }()
    
    let categoryLabel: UILabel = {
        let ct = UILabel()
        ct.text = " Entertainment"
        ct.font = .systemFont(ofSize: 13)
        ct.textColor = UIColor.darkGray
        ct.translatesAutoresizingMaskIntoConstraints = false
        return ct
    }()
    
    let priceLabel: UILabel = {
        let pl = UILabel()
        pl.text = " $3.99"
        pl.font = .systemFont(ofSize: 13)
        pl.textColor = UIColor.darkGray
        pl.translatesAutoresizingMaskIntoConstraints = false
        return pl
    }()
    func setUpViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        imageView.frame =  CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame =  CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
        
    }
    
    
}
