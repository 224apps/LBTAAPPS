//
//  HorizontalSnappingController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HorizontalSnappingController: UICollectionViewController {

    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



