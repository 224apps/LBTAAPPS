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
}






class MainViewController: UITableViewController {
    
    fileprivate  let cellID = "CellID"
    var  chatMessages :[ChatMessage] = [ ChatMessage(text:  "Here is my very first message", isIncoming: true),
                                         ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: true),
                                         
                                         ChatMessage(text: "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.", isIncoming: false),
                                         ChatMessage(text: "yo what's up bro", isIncoming: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.row]
        cell.chatMessage = chatMessage
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
}

