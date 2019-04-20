//
//  AppsSearchController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/19/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

private let CellID = "CellID"

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: CellID)
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        
        fetchItunesApps()
    }
    
    
    
    //MARK: - Custom functions.
    
    fileprivate func fetchItunesApps() {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't fetch the data from the API", error)
                return
            }
            guard let data = data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach{ print($0)}
            } catch let jsonError {
                print(jsonError)
            }
        }
        
        task.resume()
        
        
        
        
    }
    
    //MARK: - CollectionView Datasource and  Delegates
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! SearchResultCell
        
        cell.nameLabel.text = " Here is my app name"
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //MAR: UICollectionView Delegate FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 350)
    }
    
}


