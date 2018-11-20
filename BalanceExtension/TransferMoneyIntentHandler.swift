//
//  TransferMoneyIntentHandler.swift
//  BalanceExtension
//
//  Created by Robert D Almeida on 20/11/2018.
//  Copyright © 2018 Robert D Almeida. All rights reserved.
//

import Foundation
class TransferMoneyIntentHandler: NSObject, TransferMoneyIntentHandling{
    func confirm(intent: TransferMoneyIntent, completion: @escaping (TransferMoneyIntentResponse) -> Void) {
        completion(TransferMoneyIntentResponse(code: .ready, userActivity: nil))
    }
    
    func handle(intent: TransferMoneyIntent, completion: @escaping (TransferMoneyIntentResponse) -> Void) {
        completion(TransferMoneyIntentResponse(code: .success, userActivity: nil))
    }
}

