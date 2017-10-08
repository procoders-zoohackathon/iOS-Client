//
//  PhoneViewController.swift
//  zoohack
//
//  Created by Aditya Verma on 08/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController {

    
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let login = segue.destination as? MainViewController {
            login.initLogin(number: phoneNumberLabel.text!)
        }
    }
   
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        if let text = phoneNumberLabel.text, !text.isEmpty {
         performSegue(withIdentifier: "toAlertPanel", sender: self)
        } else {
            phoneNumberLabel.placeholder = "Please Enter your Phone Number."
        }
    }
    
    
}
