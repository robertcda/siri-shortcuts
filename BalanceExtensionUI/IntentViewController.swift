//
//  IntentViewController.swift
//  BalanceExtensionUI
//
//  Created by Robert D Almeida on 19/11/2018.
//  Copyright © 2018 Robert D Almeida. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonClicked(_ sender: Any) {
        self.dismiss(animated: true) {
            //Do nothing
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>,
                       of interaction: INInteraction,
                       interactiveBehavior: INUIInteractiveBehavior,
                       context: INUIHostedViewContext,
                       completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        switch interaction.intentResponse{
        case let balanceRespone as AvailableBalanceIntentResponse:
            var amount = 0
            if let uValue = balanceRespone.accountBalanceProperty{
                amount = Int(uValue) ?? 0
            }
            self.label.text = "Your account's balance is " + "\(amount)"
        case let balanceRespone as TransferMoneyIntentResponse:
            self.label.text = "transfer" + "?"
        default:
            self.label.text = "UnRecognized"
            
        }
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
//        return self.extensionContext!.hostedViewMaximumAllowedSize
        return CGSize(width: 300, height: 200)
    }
    
}
