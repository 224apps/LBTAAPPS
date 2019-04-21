//
//  AppsSearchController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/19/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit
import SDWebImage

private let CellID = "CellID"

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    fileprivate var appResults =  [Result]()
    var timer: Timer?
    fileprivate let searchController  = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
         let label = UILabel()
        label.text =  " Please enter your search term above."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
         return label
    }()
    
    
    
    
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
       // fetchItunesApps()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 0))
        setupSearBar()
    }
    //MARK: - Custom functions.
    fileprivate func setupSearBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
//    fileprivate func fetchItunesApps() {
//
//        Service.shared.fetchApps(searchTerm: "Twitter") { (results, error) in
//
//            if let error = error {
//                print("Failed to fetch apps. \(error)")
//            }
//
//            self.appResults = results
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }
    
    //MARK: - CollectionView Datasource and  Delegates
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! SearchResultCell
        cell.app = appResults[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    //MAR: UICollectionView Delegate FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 350)
    }
    
}

//MARK: - SearchBar Delegates

extension AppsSearchController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            
            Service.shared.fetchApps(searchTerm: searchText) { (results, err) in
                self.appResults = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}


