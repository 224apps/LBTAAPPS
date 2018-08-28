//
//  ChatMesageCell.swift
//  GroupedMessage
//
//  Created by Abdoulaye Diallo on 8/27/18.
//  Copyright © 2018 Abdoulaye Diallo. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell: UITableViewCell {
    let messageLabel = UILabel()
    let bubleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         self.backgroundColor = .white
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        bubleBackgroundView.addSubview(messageLabel)
        bubleBackgroundView.backgroundColor = .yellow
        bubleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubleBackgroundView.layer.cornerRadius = 16.0
        addSubview(bubleBackgroundView)
        
        //Let's work on the autolayout of the messageLabel
        
        NSLayoutConstraint.activate(
            [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
             messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
             messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
             messageLabel.widthAnchor.constraint(equalToConstant: 250),
             bubleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
             bubleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
             bubleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
             bubleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16)]
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
