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
    var locationName: String!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    func initCoordinate(latitude: Double, longitude: Double, locationName: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.locationName = locationName
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        centerMapOnLocation(location: initialLocation)
        
    }

    @IBAction func closeButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func directionButtonWasPressed(_ sender: Any) {
        openMapForPlace()
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        let artwork = Artwork(title: self.locationName,
                              locationName: self.locationName,
                              discipline: "Threat",
                              coordinate: CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude))
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(artwork)
    }
    func openMapForPlace() {
        let latitude: CLLocationDegrees = self.latitude
        let longitude: CLLocationDegrees = self.longitude
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.locationName
        mapItem.openInMaps(launchOptions: options)
    }

}
