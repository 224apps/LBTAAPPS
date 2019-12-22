//
//  MainController.swift
//  MapsDirectionsLBTA
//
//  Created by Abdoulaye Diallo on 12/22/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import MapKit
import LBTATools


class MainController: UIViewController {
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        view.backgroundColor = .white
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: view.leadingAnchor, bottom: nil,
                       trailing: view.trailingAnchor,
                       padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                       size: .init(width: view.frame.width, height: view.frame.height))
        mapView.mapType = .standard
    }
    
}

