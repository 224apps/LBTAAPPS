//
//  Extensions.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/21/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

//MARK: - UILabel

extension UILabel {
    
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

//MARK: - UIImageView
extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

//MARK: - UIButton
extension UIButton {
    convenience init(title:String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        
    }
}

//MARK: - UIStackView

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews:arrangedSubviews)
        self.spacing = customSpacing
    }
}



