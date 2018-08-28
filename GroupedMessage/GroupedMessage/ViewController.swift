//
//  ViewController.swift
//  GroupedMessage
//
//  Created by Abdoulaye Diallo on 8/27/18.
//  Copyright © 2018 Abdoulaye Diallo. All rights reserved.
//

import UIKit


 let cellID = "CellID"
class MainViewController: UITableViewController {
    
     var textMessages = [
    "Here is my very first message",
    "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.",
    "I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap.I am going to write another long message that is longer than the width of the cell so that it can show the word-wrap."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        self.tableView.separatorStyle = .none
        self.tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
    }

}

extension MainViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
         cell.messageLabel.text = textMessages[indexPath.row]
         cell.textLabel?.numberOfLines = 0
         return cell
    }
    
    
}

