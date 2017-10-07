//
//  ViewController.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell") as? AlertTableViewCell {
            let alert = DataService.instance.getData()[indexPath.row]
            cell.updateViews(alert: alert)
            return cell
        } else {
            return AlertTableViewCell()
        }
    }
    
}

