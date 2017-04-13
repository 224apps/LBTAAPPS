//
//  CategoryCell.swift
//  AppstoreDemoLBTA
//
//  Created by Abdoulaye Diallo on 4/4/17.
//  Copyright © 2017 DiaryConnect. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let horCellID = "HorCellID"
    
    var appCategory: AppCategory? {
        didSet{
            if let name = appCategory?.name {
                nameLabel.text = name
            }
            
        }
        
    }
    
    //Let's create the nameLabel for this cell...
    
    let nameLabel : UILabel = {
        let nb = UILabel()
        nb.text = "Best New App"
        nb.font = .boldSystemFont(ofSize: 13)
        nb.numberOfLines = 1
        nb.translatesAutoresizingMaskIntoConstraints = false
        return nb
    }()
    let horCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let hc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        hc.backgroundColor = .white
        hc.translatesAutoresizingMaskIntoConstraints = false
        hc.flashScrollIndicators()
        return hc
    }()
    
    //let's create a divider line View
    let  dividerLineView: UIView = {
        let dv = UIView()
        dv.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        horCollectionView.delegate = self
        horCollectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        self.backgroundColor = .clear
        addSubview(horCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        horCollectionView.register(HorAppCell.self, forCellWithReuseIdentifier: horCellID)
        // Let's add constraints on the  cell..''
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0":horCollectionView]
        ))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0":dividerLineView]
        ))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0":nameLabel]
        ))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["nameLabel":nameLabel, "v0":horCollectionView, "v1":dividerLineView]
        ))
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.apps?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = horCollectionView.dequeueReusableCell(withReuseIdentifier: horCellID, for: indexPath) as! HorAppCell
        cell.app = appCategory?.apps?[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
}
