//
//  SearchResultCell.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/19/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    
    var app : Result! {
        didSet {
            nameLabel.text =  app.trackName
            categoryLabel.text = app.primaryGenreName
            ratingsLabel.text = " Ratings: \( app.averageUserRating ?? 0)"
            let url = URL(string: app.artworkUrl100)
            appIconImageView.sd_setImage(with: url )
            screenShot1ImageView.sd_setImage(with: URL(string: app.screenshotUrls[0]))
            if app.screenshotUrls.count > 1{
                screenShot2ImageView.sd_setImage(with: URL(string: app.screenshotUrls[1]))
            }
            if app.screenshotUrls.count > 2{
                screenShot3ImageView.sd_setImage(with: URL(string: app.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.text = " APP NAME"
        return nl
    }()
    
    let categoryLabel: UILabel = {
        let nl = UILabel()
        nl.text = " Photos & videos"
        return nl
    }()
    
    let ratingsLabel: UILabel = {
        let nl = UILabel()
        nl.text = " 9.26M"
        return nl
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor =  .lightGray
        return button
    }()
    
    lazy var screenShot1ImageView = self.createImageView()
    lazy var screenShot2ImageView = self.createImageView()
    lazy var screenShot3ImageView = self.createImageView()
    
    
    
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(white: 0.95, alpha: 0.5).cgColor
        imageView.layer.borderWidth = 0.5
        
        return imageView
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [nameLabel,categoryLabel,ratingsLabel]), getButton])
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenShot1ImageView,screenShot2ImageView,screenShot3ImageView])
        screenShotsStackView.axis = .horizontal
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
        
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoStackView, screenShotsStackView], spacing: 16)
        
        
        
        
        
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
