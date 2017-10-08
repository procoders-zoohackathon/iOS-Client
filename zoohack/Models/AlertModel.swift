//
//  AlertModel.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import Foundation
import CoreData
struct AlertModel {
    
    private(set) public var message: String!
    private(set) public var latitude: Double!
    private(set) public var longitude: Double!
    private(set) public var time: String!
    private(set) public var mainTitle: String!
    
    
    
    init(message: String, latitude: Double, longitude: Double, time: String, mainTitle: String) {
        self.message = message
        self.latitude = latitude
        self.longitude = longitude
        self.time = time
        self.mainTitle = mainTitle
    }
}
