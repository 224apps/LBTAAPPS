//
//  HomeTableViewController.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 7/18/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//
import UIKit
import Firebase

class MessagesController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        let image = UIImage(named: "new_message_icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
    }
    
    @objc func handleNewMessage() {
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserAndFixNavBar()
        }
    }
    
    func fetchUserAndFixNavBar() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: AnyObject] {
                self.navigationItem.title = dict["name"] as? String
                
                let user = User(dictionary: dict)
                self.setUpNavBar(user: user)
            }
            
        }, withCancel: nil)
    }
    
    
    func setUpNavBar( user: User)  {
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        titleView.backgroundColor = .red
        
        
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(containerView)
        
        
        
        let profileView = UIImageView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        if let profileImageUrl = user.profileImageUrl {
            profileView.loadImageUsingCacheWithUrlString(profileImageUrl)
        }
        containerView.addSubview(profileView)
        //Let's set up the  anchors for the profileImageView
        profileView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        profileView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = user.name
        containerView.addSubview(nameLabel)
        //Let's work on the anchors for the nameLabel
        
        nameLabel.leftAnchor.constraint(equalTo: profileView.rightAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: profileView.heightAnchor).isActive = true
        
        
        
        
        containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        
        self.navigationItem.titleView = titleView
        
    }
    
    
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    
}


