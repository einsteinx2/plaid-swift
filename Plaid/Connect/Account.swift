//
//  Account.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import Foundation

private protocol AccountElementsTrait {
    
    var id: String { get }
    var item: String { get }
    var user: String { get }
    
    var balance: [String: Float] { get }
    var currentBalance: Float { get }
    var availableBalance: Float { get }
    
    var meta: [String: AnyObject] { get }
    var limit: Int { get }
    var name: String { get }
    var lastFour: String { get }
    
    var institutionType: String { get }
    var type: String { get }
    var subtype: String { get }
    
}

private protocol AccountInitializationTrait {
     init(account: [String: NSObject])
}

public struct Account: AccountElementsTrait, AccountInitializationTrait {
    
    // MARK: Properties
    
    /**
     The unique id of the account.
     */
    public var id: String
    
    /**
     An id unique to the accounts of a particular access token.
     */
    public var item: String
    
    /**
     An id unique to the user of a particular access token.
     */
    public var user: String
    
    /**
     The Current Balance is the total amount of funds in the account. The Available Balance is the Current Balance less any outstanding holds or debits that have not yet posted to the account. Note that not all institutions calculate the Available Balance. In the case that Available Balance is unavailable from the institution, Plaid will either return an Available Balance value of null or only return a Current Balance.
     */
    internal var balance: [String: Float]
    
    /**
     The Current Balance is the total amount of funds in the account.
     */
    public var currentBalance: Float
    
    /**
     The Available Balance is the Current Balance less any outstanding holds or debits that have not yet posted to the account.
     */
    public var availableBalance: Float
    
    /**
     Additional information pertaining to the account such as the limit, name, or last few digits of the account number.
     */
    public var meta: [String: AnyObject]
    
    /**
     Additional information pertaining to the account such as the limit.
     */
    public var limit: Int
    
    /**
     Additional information pertaining to the account such as the (product) name.
     */
    public var name: String
    
    /**
     Additional information pertaining to the account such as the last few digits of the account number.
     */
    public var lastFour: String
    
    /**
     The financial institution associated with the account. See [financial institutions](https://plaid.com/docs/api/#institutions)
     */
    public var institutionType: String
    
    /**
     See [account types](https://plaid.com/docs/api/#connect-account-types).
     */
    public var type: String
    
    /**
     A more detailed classification of the account type. When unavailable, this field will not be returned. See [subtypes](https://plaid.com/docs/api/#connect-account-subtypes) for a list of common subtype values.
     */
    public var subtype: String
 
    // MARK: Initialisation
    
    /**
     Initialise a new `Account` object from `[String: NSObject]` dictionary type.
     */
    public init(account: [String: NSObject]) {
        self.id = account["_id"] as! String
        self.item = account["_item"] as! String
        self.user = account["_user"] as! String
        
        self.balance = account["balance"] as! [String: Float]
        self.currentBalance = self.balance["current"]!
        self.availableBalance = self.balance["available"]!
        
        self.meta = account["meta"] as! [String: AnyObject]
        self.name = self.meta["name"]! as! String
        self.lastFour = self.meta["number"]! as! String
        self.limit = self.meta["limit"]! as! Int
        
        self.institutionType = account["institution_type"] as! String
        self.type = account["type"] as! String
        self.subtype = account["subtype"] as! String
    }
}