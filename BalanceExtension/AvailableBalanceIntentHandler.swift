//
//  AvailableBalanceIntentHandler.swift
//  BalanceExtension
//
//  Created by Robert D Almeida on 19/11/2018.
//  Copyright © 2018 Robert D Almeida. All rights reserved.
//

import Foundation
class AvailableBalanceIntentHandler: NSObject, AvailableBalanceIntentHandling{
    func handle(intent: AvailableBalanceIntent, completion: @escaping (AvailableBalanceIntentResponse) -> Void) {
        completion(AvailableBalanceIntentResponse.success(accountBalanceProperty: "300"))

    }
    func confirm(intent: AvailableBalanceIntent, completion: @escaping (AvailableBalanceIntentResponse) -> Void) {
        completion(AvailableBalanceIntentResponse(code: .ready, userActivity: nil))
    }
    
}
