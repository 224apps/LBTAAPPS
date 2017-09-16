//
//  WordViewCell.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/9/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import LBTAComponents

class WordViewCell: UICollectionViewCell {
    
   override init(frame: CGRect) {
        super.init(frame:frame)
      setUpViews()
    }
    

    let wordLabel: UILabel = {
        
         let wl = UILabel()
         wl.text = " TEST TEST TEST TEST "
         wl.translatesAutoresizingMaskIntoConstraints = false
        return wl
        
    }()
    
    
    func setUpViews(){
        backgroundColor =  .yellow
         addSubview(wordLabel)
        
         wordLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0  )
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
