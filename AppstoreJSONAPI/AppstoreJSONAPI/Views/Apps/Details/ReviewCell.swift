//
//  ReviewCell.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/23/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    
    var entry: Entry! {
        didSet {
            authorLabel.text = entry?.author.name.label
            titleLabel.text = entry?.title.label
            starsLabel.text = ""
            bodyLabel.text = entry?.content.label
            
            for( index, view) in  starsStackView.arrangedSubviews.enumerated() {
                if let ratingInt = Int(entry.rating.label) {
                    view.alpha =   index >= ratingInt ? 0 : 1
                }
            }
        }
    }
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 16))
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    let starsLabel = UILabel(text: "stars", font: .systemFont(ofSize: 16))
    let bodyLabel = UILabel(text: "Review Body\nReview Body\nReview Body", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    let starsStackView : UIStackView = {
        var arrangedSubViews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubViews.append(imageView)
        })
         arrangedSubViews.append(UIView())
        let stv = UIStackView(arrangedSubviews: arrangedSubViews)
         return stv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            starsStackView,bodyLabel], spacing: 12)
        addSubview(stackView)
        
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
