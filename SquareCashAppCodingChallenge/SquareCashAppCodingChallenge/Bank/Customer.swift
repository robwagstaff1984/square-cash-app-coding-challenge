//
//  Customer.swift
//  SquareCashAppCodingChallenge
//
//  Created by Robert Wagstaff on 17/8/19.
//  Copyright © 2019 Robert Wagstaff. All rights reserved.
//

import Foundation

protocol CustomerProtocol {
    var identifier: UUID { get }
    var balance: NSDecimalNumber { get }
}

class Customer : CustomerProtocol {
    let identifier: UUID
    var balance: NSDecimalNumber
    
    init(identifier: UUID = UUID(),
         balance:NSDecimalNumber = NSDecimalNumber(floatLiteral: 0)) {
        self.identifier = identifier
        self.balance = balance
    }
    
    func credit(amount: NSDecimalNumber) {
        balance = balance.adding(amount)
    }
    
    func debit(amount: NSDecimalNumber) {
        balance = balance.subtracting(amount)
    }
}
