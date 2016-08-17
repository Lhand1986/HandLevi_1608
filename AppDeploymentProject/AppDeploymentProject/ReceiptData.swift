//
//  Receipt.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/9/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import Foundation
import CoreData

/* Make a singleton that will allow the storage and cross-utilization of data */
class ReceiptData {
    // Initializing a static, shared instance of this class for use across all of the necessary View Controllers
    static let sharedInstance = ReceiptData()
    var itemArray: [Float] = []
    var batchTotalArray: [Float] = []
    var taxes: Float = 0
    var subTotal: Float = 0
    var total: Float = 0
    var taxMultiplier: Float!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    // Set up a function to assign a timestamp to each saved entry in regards to Core Data
    func timestamp() -> String{
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        return timestamp
    }
    
    func setTaxes(taxesValue: Float) {
        defaults.setObject(taxesValue, forKey: "taxMultiplier")
    }
    
    func getTaxes() {
        if (defaults.objectForKey("taxMultiplier") != nil) {
            taxMultiplier = defaults.floatForKey("taxMultiplier")
        }
    }
    
}