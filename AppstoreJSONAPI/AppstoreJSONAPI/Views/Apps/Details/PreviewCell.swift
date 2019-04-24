//
//  PreviewCell.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/23/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit


class PreviewCell: UICollectionViewCell {
    
    
     let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20))
     let previewScreenShotsController = PreviewScreenShotsController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewScreenShotsController.view)
        addSubview(previewLabel)
         previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right:20))
        
        previewScreenShotsController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor , trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
