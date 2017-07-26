//
//  Extensions.swift
//  ChatFirebaseDemo
//
//  Created by Abdoulaye Diallo on 7/18/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit


extension UIColor {
    
    
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat ) {
    self.init(red:  r / 255 , green: g/255, blue: b/255, alpha: 1)
    }
}

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    
                    self.image = downloadedImage
                }
            })
            
        }).resume()
    }
    
}

