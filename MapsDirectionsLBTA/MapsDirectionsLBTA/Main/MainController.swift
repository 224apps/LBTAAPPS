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
import SwiftUI


class MainController: UIViewController{
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        view.backgroundColor = .white
        mapView.fillSuperview()
        mapView.mapType = .standard
        setupRegionForMap()
    }
    
    fileprivate func setupRegionForMap(){
        let center = CLLocationCoordinate2D(latitude: 37.7666, longitude: -122.427290)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}

// SwiftUI Preview
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView:UIViewControllerRepresentable {
        typealias UIViewControllerType = MainController
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> MainController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainController, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}

