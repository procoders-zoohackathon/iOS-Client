//
//  AlertTableViewCell.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class AlertTableViewCell: UITableViewCell {
   
    @IBOutlet weak var messageView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    
    
    func updateViews(alert: AlertModel) {
        self.messageView.text = alert.message
        self.timeView.text = alert.time
        self.titleView.text = alert.mainTitle
    }

}
