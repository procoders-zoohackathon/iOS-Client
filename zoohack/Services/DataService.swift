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
    
  
    
    
    
    
    public var alert = [AlertModel]()
    
    func getData() -> [AlertModel]{
        return alert
    }
}
