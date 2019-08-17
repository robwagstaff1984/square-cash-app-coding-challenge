//
//  Bank.swift
//  SquareCashAppCodingChallenge
//
//  Created by Robert Wagstaff on 17/8/19.
//  Copyright © 2019 Robert Wagstaff. All rights reserved.
//

import Foundation

protocol BankProtocol {
    var balance: NSDecimalNumber { get }
    func deposit(customer: Customer, amount: NSDecimalNumber)
    func withdraw(customer: Customer, amount: NSDecimalNumber)
}

struct Bank : BankProtocol {
    let balance: NSDecimalNumber
    
    init(balance:NSDecimalNumber = NSDecimalNumber(floatLiteral: 0)) {
        self.balance = balance
    }
}

extension Bank {
    func deposit(customer: Customer, amount: NSDecimalNumber) {
        
    }
    
    func withdraw(customer: Customer, amount: NSDecimalNumber) {
        
    }
}
