//
//  BaseTabBarController.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/19/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
 
    
    override func viewDidLoad() {
        createNavControllers()
    }
    
    //MARK: - Custom Methods:
    fileprivate func createNavControllers() {
        let todayNavController = createNavController(UIViewController(), title: "Today", imageName: "today_icon")
        let appsNavController = createNavController(AppsPageController(), title: "Apps", imageName: "apps")
        let searchNavController =  createNavController(SearchViewController(), title: "Search", imageName: "search")
        viewControllers = [appsNavController, searchNavController, todayNavController]
    }
    fileprivate  func createNavController(_ viewController: UIViewController, title: String?, imageName: String ) -> UIViewController {
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        let navController =  UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
