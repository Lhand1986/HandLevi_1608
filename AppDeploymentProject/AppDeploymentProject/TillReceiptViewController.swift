//
//  TillReceiptViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/11/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit
import CoreData

class TillReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var receiptTable: UITableView!
    
    //Initialization of singleton
    let receiptItems = ReceiptData.sharedInstance
    var receiptSubtotal: Float! = 0.0
    
    //Initializing coreData structures
    var mox:NSManagedObjectContext!
    var moxDesc:NSEntityDescription!
    var moxObj:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calculate the items in the itemArray to determine a subTotal value
        for i in 0..<receiptItems.itemArray.count {
            receiptSubtotal = receiptSubtotal + receiptItems.itemArray[i]
        }
        subTotalLabel.text = String(receiptSubtotal)
        
        /* 
         DEVELOPER NOTE: THESE NEED TO BE ADDRESSED WHEN A TAXES SECTION IS ADDED TO THE OPTIONS MENU
         taxesLabel.text = String(receiptSubtotal / taxes)
         totalLabel.text = String(taxes + receiptSubtotal)
         */
        
        // Declaring the necessary variables for the managed object in Core Data
        mox = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        moxDesc = NSEntityDescription.entityForName("Receipt", inManagedObjectContext: mox)
        moxObj = NSManagedObject(entity: moxDesc, insertIntoManagedObjectContext: mox)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptItems.itemArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reusableCell", forIndexPath: indexPath) as! TillReceiptCell
        cell.setupCell(String(receiptItems.itemArray[indexPath.row]))
        return cell
    }
    
    // Saving totals out for use in the batch report, and add them to the appropriate key values in Core Data
    @IBAction func printButton(sender: AnyObject) {
        receiptItems.batchTotalArray.append(receiptSubtotal)
        let receiptDateTime = receiptItems.timestamp()
        moxObj.setValue(receiptItems.itemArray, forKey: "items");moxObj.setValue(receiptDateTime, forKey: "date")
        do {try mox.save()} catch {print("SaveFailed")}
        receiptItems.itemArray = []
    }
    // Clear out the items in view and in the itemArray, then close out the navigation controller
    @IBAction func cancelButton(sender: AnyObject) {
        receiptItems.itemArray = []
        clearItems()
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    // MARK: User defined functions
    func clearItems() {
        receiptSubtotal = 0.0
        subTotalLabel.text = ""
        taxesLabel.text = ""
        totalLabel.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
