//
//  VerticalStackView.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/20/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit


class VerticalStackView:  UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0)}
        self.axis = .vertical
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

