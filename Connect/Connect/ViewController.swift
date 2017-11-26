//
//  ViewController.swift
//  Connect
//
//  Created by Abdoulaye Diallo on 11/26/17.
//  Copyright © 2017 224apps. All rights reserved.
//

import UIKit

 let cellID = "cellID"
class ViewController: UITableViewController {


    
     let twoDimensionalArray = [
     [ "Jack", "Steve", "Mark", "John", "Alice", "Elyse"],
     ["Carl", "Chris", "Christina", "Cameron", "Carnesie"],
     ["David", "Don","Denise", "Devon", "Darrel", "Delphine"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Contact"
         navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  header = UILabel()
         header.text = "Header"
        header.backgroundColor = .lightGray
         return header
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }
}


