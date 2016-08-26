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
import TesseractOCR

/* Make a singleton that will allow the storage and cross-utilization of data */
class ReceiptData {
    // Initializing a static, shared instance of this class for use across all of the necessary View Controllers
    static let sharedInstance = ReceiptData()
    
    // MARK: Variables and constants
    var itemArray: [Float] = []
    var batchTotalArray: [Float] = []
    var taxes: Float = 0
    var subTotal: Float = 0
    var total: Float = 0
    var taxMultiplier: Float!
    let defaults = NSUserDefaults.standardUserDefaults()
    var selectedBatch: String!
    var selectedReceipt: String!
    var selectedBatchTotals: [Float] = []
    var printer: UIPrinter!
    var printerDelegate: UIPrinterPickerControllerDelegate!
    let savedPrinterURL = NSUserDefaults.standardUserDefaults().URLForKey("savedPrinter")
    
    // Set up a function to assign a timestamp to each saved entry in regards to Core Data
    func timestamp() -> String{
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        return timestamp
    }
    
    // Set up a function to assign a date stamp to specific saved entries
    func datestamp() -> String{
        let datestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        return datestamp
    }
    
    // Allow the user to set the app defaults for the tax multiplier
    func setTaxes(taxesValue: Float) {
        defaults.setObject(taxesValue, forKey: "taxMultiplier")
    }
    
    // Function to retrieve defaults from the application
    func getDefaults() {
        if (defaults.objectForKey("taxMultiplier") != nil) {
            taxMultiplier = defaults.floatForKey("taxMultiplier")
        }
    }
    
    // Function that allows the user to select a printer
    func printerSelect() {
        let printController = UIPrinterPickerController.init(initiallySelectedPrinter: printer)
        printController.delegate = printerDelegate
        printController.presentAnimated(true, completionHandler: {(completion: UIPrinterPickerController, response: Bool, error: NSError?) in
            self.printer = completion.selectedPrinter
            self.defaults.setObject(String(self.printer), forKey: "savedPrinter")
            print(String(self.printer))
            print(response)
            print(error)})
    }
    
    
}