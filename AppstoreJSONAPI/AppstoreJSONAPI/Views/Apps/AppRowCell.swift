//
//  AppRowCell.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/21/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    
    let imageView =  UIImageView(cornerRadius: 8.0)
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company name", font: .boldSystemFont(ofSize: 13))
    let getButton =  UIButton(title: "GET")
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         let stackView = UIStackView(arrangedSubviews: [ imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton])
        
         addSubview(stackView)
        stackView.fillSuperview()
        stackView.alignment = .center
        stackView.spacing = 16
        
        
        imageView.backgroundColor = .purple
        imageView.constrainHeight(constant: 64)
        imageView.constrainWidth(constant: 64)
        
        getButton.backgroundColor =  UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 16
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
