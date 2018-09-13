//
//  ViewController.swift
//  GroupedMessage
//
//  Created by Abdoulaye Diallo on 8/27/18.
//  Copyright © 2018 Abdoulaye Diallo. All rights reserved.
//

import UIKit



struct ChatMessage {
    var text: String
    let isIncoming: Bool
    let date: Date
}


extension Date {
    static func dateFromCustomString(customString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}


class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        textAlignment = .center
        textColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        font = UIFont.boldSystemFont(ofSize: 14.0)
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius =  height / 2.0
        layer.masksToBounds =  true
        return CGSize(width: originalContentSize.width + 16.0 , height: height )
    }
}

class MainViewController: UITableViewController {
    
    fileprivate  let cellID = "CellID"
    //    var chatMessages = [
    //        [
    //            ChatMessage(text:  "Here is my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
    //            ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018"))
    //        ],
    //
    //        [
    //            ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: false, date: Date.dateFromCustomString(customString: "09/07/2018")),
    //            ChatMessage(text: "yo what's up bro", isIncoming: false, date: Date.dateFromCustomString(customString: "09/07/2018"))
    //        ],
    //        [
    //            ChatMessage(text: " This is the third Message of the chat", isIncoming:false, date: Date.dateFromCustomString(customString: "10/09/2018"))
    //        ]
    //    ]
    
    var messages = [
        ChatMessage(text:  "Here is my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: false, date: Date.dateFromCustomString(customString: "09/07/2018")),
        ChatMessage(text: "yo what's up bro", isIncoming: false, date: Date.dateFromCustomString(customString: "09/07/2018")),
        ChatMessage(text: " This is the third Message of the chat", isIncoming:false, date: Date.dateFromCustomString(customString: "10/09/2018"))
    ]
    
    var chatMessages = [[ChatMessage]]()
    
    
    
    fileprivate func makeGroupMessages(){
        
        let groupedMessages =  Dictionary(grouping: messages) { (element) ->  Date in return element.date }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let groupedMessageValue = groupedMessages[key]
            chatMessages.append( groupedMessageValue ?? [])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeGroupMessages()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        self.tableView.separatorStyle = .none
        self.tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
        self.tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
}

extension MainViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            let label = DateHeaderLabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = dateString
            let containerView = UIView()
            containerView.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo:containerView.centerXAnchor ),
                label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                ])
            return containerView
        }
        return nil
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  chatMessages[section].count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        cell.backgroundColor = .clear
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

