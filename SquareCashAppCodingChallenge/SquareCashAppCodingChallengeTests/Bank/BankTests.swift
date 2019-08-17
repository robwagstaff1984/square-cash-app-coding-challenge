//
//  BankTests.swift
//  SquareCashAppCodingChallengeTests
//
//  Created by Robert Wagstaff on 17/8/19.
//  Copyright © 2019 Robert Wagstaff. All rights reserved.
//

import XCTest
@testable import SquareCashAppCodingChallenge

//When Alice deposits $30 and withdraws $20
//Then Alice’s balance will be $10 and the banks balance will be $10
//Alice will be prevented from withdrawing another $20 to prevent her balance going negative
class BankTests: XCTestCase {
    
    var bank: Bank!
    var customer: Customer!
    
    
    override func setUp() {
        bank = Bank()
        customer = Customer()
    }

    func testDepositValidAmount() {
        bank.deposit(customer: customer, amount: NSDecimalNumber(value: 30.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 30.00))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 30.00))
    }
    
    func testDepositZero() {
        bank.deposit(customer: customer, amount: NSDecimalNumber(value: 0))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0))
    }
    
    func testDepositNegative() {
        bank.deposit(customer: customer, amount: NSDecimalNumber(value: -30.00))
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0))
    }
    
    func testWithdrawLessThanCusomerBalance() {
        givenCustomerWithBalance(amount: NSDecimalNumber(value: 30))
        
        bank.withdraw(customer: customer, amount: NSDecimalNumber(value: 20.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 10.00))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 10.00))
    }
    
    func testWithdrawMoreThanCustomerBalance() {
        givenCustomerWithBalance(amount: NSDecimalNumber(value: 10))
        
        bank.withdraw(customer: customer, amount: NSDecimalNumber(value: 20.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 10.00))
    }
    
    func givenCustomerWithBalance(amount: NSDecimalNumber) {
        customer = Customer(balance: amount)
    }
}
//
//struct MockCustomer: CustomerProtocol {
//    var identifier: UUID = UUID()
//    var balance: NSDecimalNumber = NSDecimalNumber(floatLiteral: 0)
//}
