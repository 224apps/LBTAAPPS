//
//  AppsHorizontalController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/21/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHorizontalController: HorizontalSnappingController {
    
    fileprivate let CellID = "CellID"
    
    let topBottomPadding : CGFloat = 12
    let lineSpacing: CGFloat =  10
    let leftRightPadding: CGFloat = 16
    var appGroup : AppGroup?
    var didSelectHandler: ((FeedResult?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(AppRowCell.self, forCellWithReuseIdentifier: CellID)
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        collectionView.contentInset =  .init(top: 0, left: 16, bottom: 0 , right: 16)
    }
}

//MARK:  Delegates Flow Layout
extension AppsHorizontalController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.item]{
            didSelectHandler?(app)
        }
        
        
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
}
