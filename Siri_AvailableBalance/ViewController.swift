//
//  ViewController.swift
//  Siri_AvailableBalance
//
//  Created by Robert D Almeida on 19/11/2018.
//  Copyright © 2018 Robert D Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func viewBalance(_ sender: Any) {
        let alert = UIAlertController(title: "Balcne", message: "Your account balance is 10Rs", preferredStyle: .actionSheet)
        alert.addAction(.init(title: "Ok", style: .cancel, handler: { (action) in
            // Do nothing
        }))
        self.present(alert, animated: true) {
            //TODO: create and donate an Intent
        }
        
    }
    
    
}

