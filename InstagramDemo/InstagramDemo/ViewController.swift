//
//  ViewController.swift
//  InstagramDemo
//
//  Created by Abdoulaye Diallo on 12/27/18.
//  Copyright © 2018 224Apps. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: UITextField = {
        let et = UITextField()
         et.placeholder = " Email"
        et.backgroundColor = UIColor(white: 0, alpha: 0.03)
        et.borderStyle = .roundedRect
        et.font = UIFont.boldSystemFont(ofSize: 14)
         return et
    }()
    let  usernameTextField : UITextField = {
        let ut = UITextField()
        ut.placeholder = " Username"
        ut.backgroundColor = UIColor(white: 0, alpha: 0.03)
        ut.borderStyle = .roundedRect
        ut.font = UIFont.boldSystemFont(ofSize: 14)
         return ut
        
    }()
    let passwordTextField : UITextField = {
        let pt = UITextField()
        pt.backgroundColor = UIColor(white: 0, alpha: 0.03)
        pt.borderStyle = .roundedRect
        pt.font = UIFont.boldSystemFont(ofSize: 14)
        
         return pt
    }()
    let signupButton : UIButton = {
        let sb = UIButton(type: .system)
         sb.backgroundColor = UIColor.rgbColors(red: 149, green: 204, blue: 244)
         sb.setTitle("Sign up", for: .normal)
        sb.layer.cornerRadius = 5.0
        sb.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
         return sb
    }()
    
    
    //MARK: - Custom Methods
    
     func handlePlusPhoto(){
        
         let email = "abc@yahoo.fr"
         let password = "124"
        
    FIRAuth.auth().
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically plusPhotoButton.
        //Add buttons
        view.backgroundColor = .white
         view.addSubview(plusButton)
        view.addSubview(emailTextField)
        //Adding AutoLayout to the UI
        plusButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         setupStackViewUI()
    }
    func setupStackViewUI(){
        
         let blueView = UIView()
         blueView.backgroundColor = .blue
         let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signupButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
         view.addSubview(stackView)
        stackView.anchor(top: plusButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20.0, paddingLeft: 40.0, paddingBottom: 0.0, paddingRight: 40.0, width: 0, height: 200)
    }

}

