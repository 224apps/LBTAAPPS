//
//  AppsHorizontalController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/21/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit



class AppsHorizontalController: BaseListController {
    
    fileprivate let CellID = "CellID"
    
    let topBottomPadding : CGFloat = 12
    let lineSpacing: CGFloat =  10
    let leftRightPadding: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(AppRowCell.self, forCellWithReuseIdentifier: CellID)
        // Do any additional setup after loading the view.
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
             layout.scrollDirection = .horizontal
        }
    }
}

//MARK:  Delegates Flow Layout
extension AppsHorizontalController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

//MARK:  Delegates Flow Layout

extension AppsHorizontalController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing ) / 3
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
    }
}
