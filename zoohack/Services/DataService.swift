//
//  DataService.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let alert = [AlertModel(message: "Please respond guys"),
                         AlertModel(message: "What is happening?")
    ]
    
    func getData() -> [AlertModel]{
        return alert
    }
}
