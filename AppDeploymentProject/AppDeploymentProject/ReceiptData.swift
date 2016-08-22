//
//  Receipt.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/9/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import Foundation
import UIKit
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
    var selectedBatch: String!
    var selectedReceipt: String!
    
    var printer: UIPrinter!
    var printerDelegate: UIPrinterPickerControllerDelegate!
    let savedPrinterURL = NSUserDefaults.standardUserDefaults().URLForKey("savedPrinter")
    
    
    
    // Set up a function to assign a timestamp to each saved entry in regards to Core Data
    func timestamp() -> String{
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        return timestamp
    }
    
    func datestamp() -> String{
        let datestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        return datestamp
    }
    
    func setTaxes(taxesValue: Float) {
        defaults.setObject(taxesValue, forKey: "taxMultiplier")
    }
    
    func getDefaults() {
        if (defaults.objectForKey("taxMultiplier") != nil) {
            taxMultiplier = defaults.floatForKey("taxMultiplier")
        }
    }
    
    func printerSelect() {
        let printController = UIPrinterPickerController.init(initiallySelectedPrinter: printer)
        printController.delegate = printerDelegate
        printController.presentAnimated(true, completionHandler: {(completion: UIPrinterPickerController, response: Bool, error: NSError?) in
            let currentPrinter = String(completion.selectedPrinter)
            self.defaults.setObject(currentPrinter, forKey: "savedPrinter")
            print(response)
            print(error)})
    }
    
    
}