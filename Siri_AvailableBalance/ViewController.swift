//
//  ViewController.swift
//  Siri_AvailableBalance
//
//  Created by Robert D Almeida on 19/11/2018.
//  Copyright © 2018 Robert D Almeida. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Money Transfer
    @IBAction func transferMoneyTapped(_ sender: Any) {
        donateTransferIntent()
    }
    
    private func donateTransferIntent(){
        let transfer = Transfer(amount: 40.00, recipient: "Haris Pekaric", message: "Hello World")
        
        let intent = transfer.intent
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if let error = error {
                print("Did Fail \(error)")
            } else {
                print("I Donated")
            }
        }
    }
    
    //MARK: Available balance
    @IBAction func viewBalance(_ sender: Any) {
        let alert = UIAlertController(title: "Balcne", message: "Your account balance is 10Rs", preferredStyle: .actionSheet)
        alert.addAction(.init(title: "Ok", style: .cancel, handler: { (action) in
            // Do nothing
        }))
        self.present(alert, animated: true) {
            //TODO: create and donate an Intent
        }
        
        self.donateViewBalanceIntent()
    }
    
    private func donateViewBalanceIntent(){
        let intent = AvailableBalanceIntent()
        intent.suggestedInvocationPhrase = "Whats my balance?"
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { (error) in
            print("ViewController:DonateViewBalanceIntent: \(error)")
        }
        
    }
    
}


// Wrong place

struct Transfer {
    
    let amount: Double
    let recipient: String
    let message: String
}

extension Transfer {
    
    public var intent: TransferMoneyIntent {
        let transferINGMoneyIntent = TransferMoneyIntent()
        transferINGMoneyIntent.transfer = INObject(identifier: recipient, display: "idk")
        transferINGMoneyIntent.amount = amount as NSNumber
        return transferINGMoneyIntent
    }
}

