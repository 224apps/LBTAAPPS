//
//  NewMessageTableViewController.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 7/22/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NewMessageTableViewController: UITableViewController {
    
    let  cellIdentifier = "CellID"
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cancel button on the left
        
        self.tableView.register(UserCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchFireBaseUser()
    }
    
    
    //MARK - Custom Methods
    
    func fetchFireBaseUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { snapshot in
            
            if let dict = snapshot.value as? [String: AnyObject ]{
                let user = User(dictionary: dict)
               // user.setValuesForKeys(dict)
                 self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true) {
            print("Message View Dismissed")
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
         let user = users[indexPath.row]
         cell.textLabel?.text = user.name
         cell.detailTextLabel?.text = user.email
        return cell
    }
    
    
}
