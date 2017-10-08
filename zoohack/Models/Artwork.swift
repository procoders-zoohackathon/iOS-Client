//
//  Artwork.swift
//  zoohack
//
//  Created by Aditya Verma on 08/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import Foundation
import Contacts
import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
