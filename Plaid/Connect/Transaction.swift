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
    
    var pending: Bool? { get }
    var type: [String: NSObject]? { get }
    var category: [String: [String]]? { get }
    var categoryID: String? { get }
    
    var score: [String: NSObject] { get }
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
    
    public var id: String
    public var account: String
    
    public var name: String?
    public var amount: Float?
    public var date: NSDate?
    
    internal var meta: [String: NSObject]?
    public var address: String?
    public var city: String?
    public var state: String?
    public var zip: String?
    public var longitude: Double?
    public var latitude: Double?
    
    public var pending: Bool?
    public var type: [String: NSObject]?
    public var category: [String: [String]]?
    public var categoryID: String?
    
    internal var score: [String: NSObject]
    public var stateScore: Float?
    public var cityScore: Float?
    public var addressScore: Float?
    
    public var referenceNumber: Int?
    public var pendingTransaction: Bool?
    
    // MARK: Initialisation
    
}
