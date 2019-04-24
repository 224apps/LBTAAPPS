//
//  PreviewHorizontalController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/23/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit



class ScreenShotCell:  UICollectionViewCell {
    
    let screenShotImageView = UIImageView(cornerRadius: 12.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screenShotImageView)
        screenShotImageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PreviewScreenShotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let previewCellID = "previewCellID"
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: previewCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:previewCellID , for: indexPath) as! ScreenShotCell
        
        let screenShotUrl = self.app?.screenshotUrls[indexPath.item]
        cell.screenShotImageView.sd_setImage(with:  URL(string:screenShotUrl ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
    
}
