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
    mutating func deposit(customerId: UUID, amount: NSDecimalNumber)
    mutating func withdraw(customerId: UUID, amount: NSDecimalNumber)
}

struct Bank : BankProtocol {
    
    var customers: [Customer]
    
    var balance: NSDecimalNumber {
        return customers.reduce(0) { $0.adding($1.balance) }
    }
    
    init(customers: [Customer] = []) {
        self.customers = customers
    }
}

extension Bank {
    mutating func deposit(customerId: UUID, amount: NSDecimalNumber) {
        guard let customer = customers.first(where: {$0.identifier == customerId}) else { return }
        guard amount.compare(0) == ComparisonResult.orderedDescending else { return }
        
        customer.credit(amount: amount)
    }
    
    mutating func withdraw(customerId: UUID, amount: NSDecimalNumber) {
        guard let customer = customers.first(where: {$0.identifier == customerId}) else { return }
        guard customer.balance.compare(amount) != ComparisonResult.orderedAscending else { return }
        
        customer.debit(amount: amount)
    }
}
