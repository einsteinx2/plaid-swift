//
//  PlaidClientTests.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import XCTest
@testable import Plaid

class PlaidClientTests: XCTestCase {
    
    /**
     @description Initialises a new **PlaidClient** object
     
     @info Uses the Development (Tartain) credentials. 
     Provided on [https://plaid.com/docs/api/#gaining-access](https://plaid.com/docs/api/#gaining-access).
     
     @return PlaidClient.
     */
    func testCreateNewClient() -> PlaidClient {
        return PlaidClient(clientID: PlaidConstants.TestClientID, secretKey: PlaidConstants.TestSecret, productionMode: false)
    }
    
    /**
     @description Initialises a new **PlaidClient** object and prints out important details about that instance.
     
     @return Nothing.
     */
    func testPrintClientDetails() {
        let client = self.testCreateNewClient()
        print("Client Secret: \(client.secretKey)")
        print("Client ID: \(client.clientID)")
        print("API Host: \(client.apiHost)")
    }

}
