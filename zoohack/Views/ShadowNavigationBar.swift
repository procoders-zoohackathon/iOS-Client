//
//  ShadowNavigationBar.swift
//  zoohack
//
//  Created by Aditya Verma on 08/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class ShadowNavigationBar: UINavigationBar {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: 1.0, height: 5.0)
        layer.cornerRadius = 8.0
    }

}
