
//
//  AppsHeaderHorizontalController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController : BaseListController {
     let CellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
         collectionView.register( AppHeaderCell.self, forCellWithReuseIdentifier: CellID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
             layout.scrollDirection = .horizontal
        }
    }
}


//MARK: - CollectionView Delegates and DataSource
extension AppsHeaderHorizontalController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! AppHeaderCell
         return cell
    }
}

//MARK : -  CollectionView Delegate Flow Layout.

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width - 48, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
}
