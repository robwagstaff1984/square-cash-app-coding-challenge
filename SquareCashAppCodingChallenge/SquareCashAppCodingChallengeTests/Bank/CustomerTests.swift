//
//  CustomerTests.swift
//  SquareCashAppCodingChallengeTests
//
//  Created by Robert Wagstaff on 17/8/19.
//  Copyright © 2019 Robert Wagstaff. All rights reserved.
//

import XCTest
@testable import SquareCashAppCodingChallenge

class CustomerTests: XCTestCase {

    var customer: Customer!
    
    func testDebitWhenEnoughFunds() {
        customer = Customer(balance: NSDecimalNumber(value: 100))
        customer.debit(amount: NSDecimalNumber(value: 8.32))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 91.68))
    }
    
    func testDebitWhenExactAmountOfFunds() {
        customer = Customer(balance: NSDecimalNumber(value: 100))
        customer.debit(amount: NSDecimalNumber(value: 100))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 0))
    }
    
    func testDebitWhenNotEnoughFunds() {
        customer = Customer(balance: NSDecimalNumber(value: 100))
        customer.debit(amount: NSDecimalNumber(value: 999))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 100))
    }
    
    func testCredit() {
        customer = Customer(balance: NSDecimalNumber(value: 100))
        customer.credit(amount: NSDecimalNumber(value: 123.12))
        XCTAssertEqual(customer.balance, NSDecimalNumber(value: 223.12))
    }
}
