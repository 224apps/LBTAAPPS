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
    
    var showIndexpaths = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Contact"
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleIndexPath))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    @objc func handleIndexPath(){
        var indexpathToreload = [IndexPath]()
        for section in twoDimensionalArray.indices {
            for  row in twoDimensionalArray[section].indices{
                let indexpath = IndexPath(row: row , section: section)
                indexpathToreload.append(indexpath)
            }
        }
        showIndexpaths = !showIndexpaths
        let animationStyle = showIndexpaths ? UITableViewRowAnimation.right : .left
        tableView.reloadRows(at: indexpathToreload, with: animationStyle)
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
        cell.textLabel?.text = "\(name)"
    
        if showIndexpaths{
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        }
        return cell
    }
}


