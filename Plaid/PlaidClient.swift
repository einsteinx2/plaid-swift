//
//  PlaidClient.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import Foundation

public class PlaidClient: NSObject {
    
    // MARK: Authentication
    public var clientID: String
    public var secretKey: String
    public var token: String?
    
    // MARK: Location
    private var productionMode: Bool
    public var apiHost: String {
        get {
            return self.apiHost(productionMode: productionMode)
        }
    }
    
    // MARK: Initialisation
    public init(clientID: String, secretKey: String, productionMode: Bool) {
        self.clientID = clientID
        self.secretKey = secretKey
        self.productionMode = productionMode
    }
    
    public init(clientID: String, secretKey: String, productionMode: Bool, token: String) {
        self.clientID = clientID
        self.secretKey = secretKey
        self.productionMode = productionMode
        self.token = token
    }
    
    // MARK: Modelling
    func apiHost(productionMode productionMode: Bool) -> String {
        guard productionMode else {
            return PlaidConstants.DevelopmentAPIHost
        }
        
        return PlaidConstants.ProductionAPIHost
    }
    
}