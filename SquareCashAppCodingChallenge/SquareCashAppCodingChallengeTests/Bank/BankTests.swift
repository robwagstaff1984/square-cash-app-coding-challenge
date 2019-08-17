//
//  BankTests.swift
//  SquareCashAppCodingChallengeTests
//
//  Created by Robert Wagstaff on 17/8/19.
//  Copyright © 2019 Robert Wagstaff. All rights reserved.
//

import XCTest
@testable import SquareCashAppCodingChallenge

class BankTests: XCTestCase {
    
    var bank: Bank!
    var customer: Customer!
    
    override func setUp() {
        givenOneCustomerWithBalance(amount: 0)
    }

    func testDepositValidAmount() {
        bank.deposit(customerId: customer.identifier, amount: NSDecimalNumber(value: 30.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 30.00))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 30.00))
    }
    
    func testDepositZero() {
        bank.deposit(customerId: customer.identifier, amount: NSDecimalNumber(value: 0))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0))
    }
    
    func testDepositNegative() {
        bank.deposit(customerId: customer.identifier, amount: NSDecimalNumber(value: -30.00))
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0))
    }
    
    func testWithdrawLessThanCustomerBalance() {
        givenOneCustomerWithBalance(amount: NSDecimalNumber(value: 30))
        
        bank.withdraw(customerId: customer.identifier, amount: NSDecimalNumber(value: 20.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 10.00))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 10.00))
    }
    
    func testWithdrawAllOfCustomerBalance() {
        givenOneCustomerWithBalance(amount: NSDecimalNumber(value: 50))
        
        bank.withdraw(customerId: customer.identifier, amount: NSDecimalNumber(value: 50.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 0.00))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0.00))
    }
    
    func testWithdrawMoreThanCustomerBalance() {
        givenOneCustomerWithBalance(amount: NSDecimalNumber(value: 10))
        
        bank.withdraw(customerId: customer.identifier, amount: NSDecimalNumber(value: 20.00))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 10))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 10.00))
    }
    
    func testMultipleCustomersCalculatesBalance() {
        givenMultipleCustomers()
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 100.00))
        
        bank.deposit(customerId: customer.identifier, amount: NSDecimalNumber(value: 99.12))
        
        XCTAssertEqual(bank.balance, NSDecimalNumber(value: 199.12))
    }
    
    private func givenOneCustomerWithBalance(amount: NSDecimalNumber) {
        customer = Customer(balance: amount)
        bank = Bank(customers: [customer])
    }
    
    private func givenMultipleCustomers() {
        customer = Customer(balance: 0)
        bank = Bank(customers: [customer, Customer(balance: 100)])
    }
}
