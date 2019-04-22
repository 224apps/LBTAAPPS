//
//  AppHeaderCell.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "facebook", font: .systemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever.", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8.0)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        titleLabel.numberOfLines = 2
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, imageView], spacing: 12)
        companyLabel.textColor = .blue
        imageView.backgroundColor = .red
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0  ))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
