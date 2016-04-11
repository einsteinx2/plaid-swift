//
//  TransactionTests.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-11.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import XCTest
@testable import Plaid

class TransactionTests: XCTestCase {

    /// Creates an *unstructured* Transaction (Sample data from documentation).
    func createTestableDictionary() -> [String: NSObject] {
        let transactionDictionary = ["_account": "YzzrzBrO9OSzo6BXwAvVuL5dmMKMqkhOoEqeo",
                                     "_id": "600r0LrVvViXjq96lBpdtyOWboBvzmsaZoeaVz",
                                     "amount": 12.74,
                                     "date": "2016-03-12",
                                     "name": "Golden Crepes",
                                     "meta": ["location": ["address": "262 W 15th St", "city": "New York", "state": "NY", "zip": "10011",
                                                          "coordinates": ["lat": 40.740352, "lon": -74.001761]]],
                                     "pending": false,
                                     "type": ["primary": "place"],
                                     "category": ["Food and Drink", "Restaurants"],
                                     "category_id": "13005000",
                                     "score": ["location": ["address": 1, "city": 1, "state": 1], "name": 0.9]]
   
        return transactionDictionary
    }
    
    /// Initialises a *structured* Transaction valuetype.
    func testCreateAccount() {
        let transactionDictionary = self.createTestableDictionary()
        let transaction = Transaction(transaction: transactionDictionary)
        
        print("ID: \(transaction.id)")
        print("Account: \(transaction.account)")
        
        print("Name: \(transaction.name)")
        print("Amount: \(transaction.amount)")
        print("Date: \(transaction.date)")
        
        print("Address: \(transaction.address), \(transaction.city) \(transaction.state), \(transaction.zip)")
        print("Coordinates: \(transaction.longitude), \(transaction.latitude)")
        print("Contact: \(transaction.contact)")
        
        print("Pending: \(transaction.pending)")
        print("Type: \(transaction.type)")
    }

}
