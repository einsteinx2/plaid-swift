//
//  AccountTests.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import XCTest
@testable import Plaid

class AccountTests: XCTestCase {

    func createTestableDictionary() -> [String: NSObject] {
        let accountDictionary = ["_id": "YzzrzBrO9OSzo6BXwAvVuL5dmMKMqkhOoEqeo",
                       "_item": "aWWVW4VqGqIdaP495QyOSVLN1nzjLwhXaPDJJ",
                       "_user": "bkkVkMVwQwfYmBMy9jzqHQob9O1KwpFaEyLOE",
                       "balance": ["available": 7205.23, "current": 7255.24],
                       "institution_type": "fake_institution",
                       "meta": ["name": "Plaid Credit Card", "number": "3002", "limit": 12500],
                       "type": "depository",
                       "subtype": "checking"]
        
        return accountDictionary
    }
    
    func testCreateAccount() {
        let accountDictionary = self.createTestableDictionary()
        let account = Account(account: accountDictionary)

        print("ID: \(account.id)")
        print("Item: \(account.item)")
        print("User: \(account.user)")
        
        print("Current Balance: \(account.currentBalance)")
        print("Available Balance: \(account.availableBalance)")
        
        print("Limit: \(account.limit)")
        print("Name: \(account.name)")
        print("Last Four: \(account.lastFour)")
        
        print("Institution Type: \(account.institutionType)")
        print("Type: \(account.type)")
        print("Subtype: \(account.subtype)")
    }

}
