//
//  ViewController.swift
//  Connect
//
//  Created by Abdoulaye Diallo on 11/26/17.
//  Copyright © 2017 224apps. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    let cellID = "cellID"
    
    func someMethodIwantToCall(cell: UITableViewCell){
        
        let indexPathTapped = tableView.indexPath(for: cell)
        
         let contact = twoDimensionalArray[indexPathTapped!.section].names[indexPathTapped!.row]
         print(contact)
        
         let hasFavorited = contact.hasFavorited
        twoDimensionalArray[indexPathTapped!.section].names[indexPathTapped!.row].hasFavorited = hasFavorited
        
    }
    
    
    var twoDimensionalArray = [
//        ExpandableNames(isExpanded: true, names:  [ "Jack", "Steve", "Mark", "John", "Alice", "Elyse"]),
//        ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christina", "Cameron", "Carnesie"]),
        
     //   "David", "Don","Denise", "Devon", "Darrel",
     ExpandableNames(isExpanded: true, names:  [Contact(name: "Delphine", hasFavorited: false)])]
    
    var showIndexpaths = false
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Contact"
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleIndexPath))
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellID)
    }
    
    @objc func handleIndexPath(){
        var indexpathToreload = [IndexPath]()
        for section in twoDimensionalArray.indices {
            for  row in twoDimensionalArray[section].names.indices{
                let indexpath = IndexPath(row: row , section: section)
                indexpathToreload.append(indexpath)
            }
        }
        showIndexpaths = !showIndexpaths
        let animationStyle = showIndexpaths ? UITableViewRowAnimation.right : .left
        tableView.reloadRows(at: indexpathToreload, with: animationStyle)
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
         button.setTitle("Close", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action:  #selector(closeOrOpenTable), for: .touchUpInside)
        button.tag = section
         return button
    }
    
    @objc func closeOrOpenTable(button: UIButton){
     let section = button.tag
    
    var indexpaths = [IndexPath]()
        for  row in twoDimensionalArray[section].names.indices{
            let indexpath = IndexPath(row: row , section: section)
            indexpaths.append(indexpath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open":"Close", for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexpaths, with: .fade)
        } else {
            
             tableView.insertRows(at: indexpaths, with: .fade)
        }
//         twoDimensionalArray[section].names.removeAll()

    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !twoDimensionalArray[section].isExpanded {
             return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ContactCell
        cell.link = self
        let contact = twoDimensionalArray[indexPath.section].names[indexPath.row]
        cell.textLabel?.text = "\(contact.name)"
        
        cell.accessoryView?.tintColor = contact.hasFavorited ?  UIColor.red : .gray
        if showIndexpaths{
        cell.textLabel?.text = "\(contact.name) Section: \(indexPath.section) Row: \(indexPath.row)"
        }
        return cell
    }
}


