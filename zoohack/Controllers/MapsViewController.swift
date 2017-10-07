//
//  MapsViewController.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    var latitude: Double!
    var longitude: Double!
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var mapView: MKMapView!
    
    func initCoordinate(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        centerMapOnLocation(location: initialLocation)
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
