//
//  ChatViewController.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 7/26/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import Firebase
class ChatLogViewController: UICollectionViewController , UITextFieldDelegate {
    
    let cellID = "CellId"
    var user: User? {
        didSet{
            navigationItem.title = user?.name
        }
    }
    
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let separatorView: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.black
        return sv
    }()
    
    lazy var messTextField : UITextField = {
        let mt = UITextField()
        mt.translatesAutoresizingMaskIntoConstraints = false
        mt.placeholder = "Enter your text here..."
        mt.delegate = self
        return mt
    }()
    let messSendButton: UIButton = {
        let  mb = UIButton(type: UIButtonType.system)
        mb.setTitle("Send", for: .normal)
        mb.titleLabel?.textColor = UIColor.blue
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.addTarget(self , action: #selector(handleSend), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID )
        view.addSubview(containerView)
        containerView.addSubview(separatorView)
        containerView.addSubview(messTextField)
        containerView.addSubview(messSendButton)
        setupContainerView()
        setupSeparatorView()
        setupMessTextField()
        setupMessButton()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Methods
    func setupContainerView(){
        //The container Constraints..
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSeparatorView(){
        //Let's work on the width of the separator View
        separatorView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupMessTextField()  {
        //Let's work on the constraint of the message Text Field
        messTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        messTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        messTextField.rightAnchor.constraint(equalTo: messSendButton.leftAnchor).isActive = true
        messTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
    }
    
    func setupMessButton(){
        // Let's work on the constraint of the  button
        messSendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        messSendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        messSendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        messSendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
    }
    
    

    // MARK: Custom Functions...
    
    @objc func handleSend()  {
        
        let ref =  Database.database().reference().child("messages")
        let childRef = ref.childByAutoId()
        let values = ["text":  messTextField.text!,  ]
        childRef.updateChildValues(values)
        
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        // Configure the cell
        return cell
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        messTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}
