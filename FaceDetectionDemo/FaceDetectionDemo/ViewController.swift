//
//  ViewController.swift
//  FaceDetectionDemo
//
//  Created by Abdoulaye Diallo on 7/8/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        guard  let image = UIImage(named: "img1")  else { return }
        let imageView = UIImageView(image: image)
        
        let scaleHeight = view.frame.width / image.size.width * image.size.height
        imageView.frame = CGRect(x: 0, y: 0, width:self.view.frame.width  , height: scaleHeight)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        view.addSubview(imageView)
        
        let request = VNDetectFaceRectanglesRequest { (req, error) in
            if let err = error {
                print("Failed Request with error ", err)
                return
            }
            
            req.results?.forEach({ (res) in
                guard let faceObser = res as? VNFaceObservation else { return }
                print( faceObser.boundingBox)
                
                let x = self.view.frame.width * faceObser.boundingBox.origin.x
                 let height = scaleHeight * faceObser.boundingBox.height
                let y = scaleHeight * (1 - faceObser.boundingBox.origin.y) - height
                let width = self.view.frame.width * faceObser.boundingBox.width
                
                
                let  blueView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
                blueView.backgroundColor = .blue
                blueView.alpha = 0.4
                self.view.addSubview(blueView)
                
            })
            
            
            
        }
        guard let  cgImage  = image.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage:cgImage, options: [:])
        do {
            try handler.perform([request])
            
        } catch let reqError {
            print("Failed to  perform request: ", reqError)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

