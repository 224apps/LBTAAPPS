//
//  ViewController.swift
//  FacebookAppDemo
//
//  Created by Abdoulaye Diallo on 3/15/17.
//  Copyright © 2017 Abdoulaye. All rights reserved.
//

import UIKit

 let cellID = "CellID"

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Facebook Feed"
        collectionView?.backgroundColor = UIColor(white: 0.9, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 88.0)
    }
}



extension HomeViewController {
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
         cell.backgroundColor = .white
        
        return cell
    }
}

