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

struct Customer : CustomerProtocol {
    let identifier: UUID
    let balance: NSDecimalNumber
    
    init(identifier: UUID = UUID(),
         balance:NSDecimalNumber = NSDecimalNumber(floatLiteral: 0)) {
        self.identifier = identifier
        self.balance = balance
    }
}
