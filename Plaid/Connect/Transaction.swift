//
//  Transaction.swift
//  Plaid
//
//  Created by Willow Bumby on 2016-04-10.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import Foundation

private protocol TransactionElementsTrait {
    
    var id: String { get }
    var account: String { get }
    
    var name: String? { get }
    var amount: Float? { get }
    var date: NSDate? { get }
    
    var meta: [String: NSObject]? { get }
    var address: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zip: String? { get }
    var longitude: Double? { get }
    var latitude: Double? { get }
    var contact: String? { get }
    
    var pending: Bool? { get }
    var type: [String: NSObject]? { get }
    var category: [String: [String]]? { get }
    var categoryID: String? { get }
    
    var score: [String: NSObject]? { get }
    var stateScore: Float? { get }
    var cityScore: Float? { get }
    var addressScore: Float? { get }
    
    var referenceNumber: Int? { get }
    var pendingTransaction: Bool? { get }
    
}

private protocol TransactionInitializationTrait {
    init(transaction: [String: NSObject])
}

public struct Transaction: TransactionElementsTrait {
    
    // MARK: Properties
    
    /**
     The unique id of the transaction.
     */
    public var id: String
    
    /**
     The id of the account in which this transaction occurred.
     */
    public var account: String
    
    /**
     The name of the transaction.
     */
    public var name: String?
    
    /**
     	The settled dollar value. Positive values when money moves out of the account; negative values when money moves in. For example, purchases are positive; credit card payments, direct deposits, refunds are negative.
     */
    public var amount: Float?
    
    /**
     The date that the transaction took place in ISO 8601 format.
     */
    public var date: NSDate?
    
    /**
     See [meta details](https://plaid.com/docs/api/#connect-meta-options).
     */
    internal var meta: [String: NSObject]?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var address: String?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var city: String?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var state: String?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var zip: String?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var longitude: Double?
    
    /**
     Detailed merchant location data including address, city, state, zip code, and geo-coordinates where available.
     */
    public var latitude: Double?
    
    /**
     Phone number associated with the merchant.
     */
    var contact: String?
    
    /**
     When `true`, identifies the transaction as pending or unsettled. Pending transaction details (name, type, amount) may change before they are settled.
     */
    public var pending: Bool?
    
    /**
     Place, Digital, Special, or Unresolved.
     */
    public var type: [String: NSObject]?
    
    /**
     An hierarchical array of the categories to which this transaction belongs. See [category](https://plaid.com/docs/api/#Categories).
     */
    public var category: [String: [String]]?
    
    /**
     The id of the category to which this transaction belongs. See [category](https://plaid.com/docs/api/#Categories).
     */
    public var categoryID: String?
    
    /**
     A numeric representation of our confidence in the meta data we attached to the transaction. In the case of a score <.9 we will default to guaranteed and known information.
     */
    internal var score: [String: NSObject]?
    
    /**
     A numeric representation of our confidence in the meta data we attached to the transaction. In the case of a score <.9 we will default to guaranteed and known information.
     */
    public var stateScore: Float?
    
    /**
     A numeric representation of our confidence in the meta data we attached to the transaction. In the case of a score <.9 we will default to guaranteed and known information.
     */
    public var cityScore: Float?
    
    /**
     A numeric representation of our confidence in the meta data we attached to the transaction. In the case of a score <.9 we will default to guaranteed and known information.
     */
    public var addressScore: Float?
    
    /**
     A unique attribute that is used by the bank/payment processor to identify transactions—where applicable.
     */
    public var referenceNumber: Int?
    
    /**
     The id of a posted transaction's associated pending transaction—where applicable.
     */
    public var pendingTransaction: Bool?
    
    // MARK: Initialisation
    
}
