//
//  AppsDetailsController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/22/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class AppsDetailsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let DetailsCellID = "DetailsCellID"
    let previewCellID = "previewCellID"
    let reviewsCellID = "reviewsCellID"
    
    var app: Result?
    var reviews: Reviews?
    
    fileprivate let appID: String
    
    //Dependency injection constructor
    init(appID: String){
        self.appID = appID
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: DetailsCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        collectionView.register(ReviewsRowCell.self, forCellWithReuseIdentifier: reviewsCellID)
        navigationItem.largeTitleDisplayMode = .never
        
         fetchData()
    }
    
    fileprivate func fetchData(){
        
        let urlString = "https://itunes.apple.com/lookup?id=\(appID)"
        
        Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
            let app =  result?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        let reviewsUrl =  "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appID)/sortby=mostrecent/json?l=en&cc=us"
        
        Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews?, error) in
            
            if let error = error {
                print("Couldn't fetch the reviews data", error)
            }
            
            DispatchQueue.main.async {
                self.reviews =  reviews
            }
        }
    }
    //MARK: - CollectionView Delegates and datasource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item  == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCellID, for: indexPath) as! AppDetailCell
            cell.app =  app
            return cell
        } else  if indexPath.item ==  1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            cell.previewScreenShotsController.app = app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewsCellID, for: indexPath) as! ReviewsRowCell
             cell.reviewsController.reviews = self.reviews
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculate the neccessary size
        var height: CGFloat = 280
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            let estimatedSize =  dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
}
