//
//  AlertModel.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import Foundation

struct AlertModel {
    
    private(set) public var message: String!
    
    init(message: String) {
        self.message = message
    }
}
