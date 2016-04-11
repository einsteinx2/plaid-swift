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
    var scoreName: String? { get }
    
    var referenceNumber: Int? { get }
    var pendingTransaction: Bool? { get }
    
}

private protocol TransactionInitializationTrait {
    init(transaction: [String: NSObject])
}

public struct Transaction: TransactionElementsTrait, TransactionInitializationTrait {
    
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
    public var scoreName: String?
    
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
    init(transaction: [String : NSObject]) {
        
        self.account = transaction["_account"] as! String
        self.id = transaction["_id"] as! String
        
        if let name = transaction["name"] as? String {
            self.name = name
        }
        
        if let amount = transaction["amount"] as? Float {
            self.amount = amount
        }
        
        if let dateString = transaction["date"] as? String {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            if let date = formatter.dateFromString(dateString) {
                self.date = date
            }
        }
        
        if let meta = transaction["meta"] as? [String: NSObject] {
            if let location = meta["location"] as? [String: NSObject] {
                if let address = location["address"] as? String {
                    self.address = address
                }
                
                if let city = location["city"] as? String {
                    self.city = city
                }
                
                if let state = location["state"] as? String {
                    self.state = state
                }
                
                if let zip = location["zip"] as? String {
                    self.zip = zip
                }
                
                if let coordinates = location["coordinates"] as? [String: Double] {
                    if let longitude = coordinates["lon"] {
                        self.longitude = longitude
                    }
                    
                    if let latitude = coordinates["lat"] {
                        self.latitude = latitude
                    }
                }
            }
            
            if let contact = meta["contact"] as? String {
                self.contact = contact
            }
            
            self.meta = meta
        }
        
        if let pending = transaction["pending"] as? Bool {
            self.pending = pending
        }
        
        if let type = transaction["type"] as? [String: NSObject] {
            self.type = type
        }
        
        if let category = transaction["category"] as? [String: [String]] {
            self.category = category
        }
        
        if let categoryID = transaction["category_id"] as? String {
            self.categoryID = categoryID
        }
        
        if let score = transaction["score"] as? [String: NSObject] {
            if let location = score["score"] as? [String: Float] {
                if let addressScore = location["address"] {
                    self.addressScore = addressScore
                }
                
                if let cityScore = location["city"] {
                    self.cityScore = cityScore
                }
                
                if let stateScore = location["state"] {
                    self.stateScore = stateScore
                }
            }
            
            if let scoreName = score["name"] as? String {
                self.scoreName = scoreName
            }
            
            self.score = score
        }
    }
}
