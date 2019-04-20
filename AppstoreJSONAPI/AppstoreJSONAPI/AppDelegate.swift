//
//  AppDelegate.swift
//  AppstoreJSONAPI
//
//  Created by Avenue Code on 4/19/19.
//  Copyright © 2019 224apps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
         window?.rootViewController = BaseTabBarController()
         window?.makeKeyAndVisible()
        return true
    }
}

