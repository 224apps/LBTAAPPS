//
//  AppCategory.swift
//  AppstoreDemoLBTA
//
//  Created by Abdoulaye Diallo on 4/4/17.
//  Copyright © 2017 DiaryConnect. All rights reserved.
//

import Foundation

class AppCategory: NSObject {
    
    var name: String?
    var apps :[App]?
    
    
    static func sampleAppCategories() -> [AppCategory] {
        
        var apps = [App]()
        
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        let  facebookApp = App()
        facebookApp.name = "Facebook"
        facebookApp.id = 1
        facebookApp.imageName = "facebook"
        facebookApp.category = "Entertainment"
        facebookApp.price = NSNumber(value:2.99)
        
        let  gmailApp = App()
        gmailApp.name = "Gmail"
        gmailApp.category = "Entertaiment"
        gmailApp.imageName = "gmail"
        gmailApp.price = NSNumber(value:1.99)
        gmailApp.id = 2
        
        apps.append(facebookApp)
        apps.append(gmailApp)
        bestNewAppsCategory.apps = apps
        
        
        
        let  bestNewGameCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Games"
        
        let bestNewGamesApps = [App]()
        
        let game1 = App()
        game1.name = "Game 1"
        game1.id = 1
        game1.imageName = "app1"
        game1.category = " Game"
        game1.price = NSNumber(value: 1.99)
        
        bestNewGameCategory.apps = bestNewGamesApps
        
        
        return [bestNewAppsCategory, bestNewGameCategory ]
    }
}



