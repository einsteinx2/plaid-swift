//
//  PlaidClient.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import Foundation

private protocol AuthenticationTrait {
    var clientID: String { get }
    var secretKey: String { get }
    var accessToken: String? { get }
}

private protocol DestinationTrait {
    var productionMode: Bool { get set }
    var apiHost: String { get }
}

private protocol ClientInitializationTrait {
    init(clientID: String, secretKey: String, productionMode: Bool)
    init(clientID: String, secretKey: String, productionMode: Bool, accessToken: String)
    func apiHost(productionMode productionMode: Bool) -> String
}

public class PlaidClient: NSObject, AuthenticationTrait, DestinationTrait, ClientInitializationTrait {
    
    // MARK: Authentication
    
    /**
     To gain access to the Plaid API, create an account on [https://plaid.com](https://plaid.com). Upon completion of the signup process and acknowledgement of our terms, you will be provided with a live `client_id` and `secret` on the dashboard.
     */
    public var clientID: String
    
    /**
     To gain access to the Plaid API, create an account on [https://plaid.com](https://plaid.com). Upon completion of the signup process and acknowledgement of our terms, you will be provided with a live `client_id` and `secret` on the dashboard.
     */
    public var secretKey: String
    
    /**
     The `ACCESS_TOKEN` of the user whose account you wish to query.
     */
    public var accessToken: String?
    
    // MARK: Destination
    
    /**
     @description Set to `false` to send requests to [https://tartan.plaid.com/](https://tartan.plaid.com/) 
     or to `true` for the Production server.
     
     @info `true` = Production Mode and `false` = Development Mode.
     
     */
    private var productionMode: Bool
    
    /**
     API Host in use (Development/Production. See `private var productionMode: Bool { get } ` for more.
     */
    internal var apiHost: String {
        get {
            return self.apiHost(productionMode: productionMode)
        }
    }
    
    // MARK: Initialisation
    
    /**
     @description Initialise a new **PlaidClient** object with standard details.
     
     @return new `PlaidClient()`.
     */
    public required init(clientID: String, secretKey: String, productionMode: Bool) {
        self.clientID = clientID
        self.secretKey = secretKey
        self.productionMode = productionMode
    }
    
    /**
     @description Initialise a new **PlaidClient** object with standard details and a token.
     
     @return new `PlaidClient()`.
     */
    public required init(clientID: String, secretKey: String, productionMode: Bool, accessToken: String) {
        self.clientID = clientID
        self.secretKey = secretKey
        self.productionMode = productionMode
        self.accessToken = accessToken
    }
    
    // MARK: Modelling
    
    /**
     @description Return an API Host for which mode the environment is in.
     
     @info `true` = Production Mode and `false` = Development Mode.
     
     @return `String`.
     */
    private func apiHost(productionMode productionMode: Bool) -> String {
        guard productionMode else {
            return PlaidConstants.DevelopmentAPIHost
        }
        
        return PlaidConstants.ProductionAPIHost
    }
}