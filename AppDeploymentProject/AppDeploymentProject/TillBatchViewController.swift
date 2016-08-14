//
//  TillBatchViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/13/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit
import CoreData

class TillBatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    //Declaring singleton reference
    let receiptData = ReceiptData.sharedInstance
    
    var batchTimeDate: String!
    var dayTotal: Float = 0.0
    
    //Declaring objects for use in Core Data
    var managedContext:NSManagedObjectContext!
    var entityDescription:NSEntityDescription!
    var batch:NSManagedObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate the totals for use in the batch report
        if receiptData.batchTotalArray.count > 0 {
            for i in 0..<receiptData.batchTotalArray.count {
                dayTotal = dayTotal + receiptData.batchTotalArray[i]
            }
            totalLabel.text = String(dayTotal)
        }
        
        //Setting up objects for use in core data
        managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        entityDescription = NSEntityDescription.entityForName("Batch", inManagedObjectContext: managedContext)
        batch = NSManagedObject(entity: entityDescription, insertIntoManagedObjectContext: managedContext)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptData.batchTotalArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repeatingCell", forIndexPath: indexPath) as! BatchCell
        cell.setupCell(String(receiptData.batchTotalArray[indexPath.row]))
        return cell
    }
    
    // MARK: IBActions
    
    // Apply data values to the Core Data, clear the necessary arrays afterwards
    @IBAction func printDay(sender: AnyObject) {
        batchTimeDate = receiptData.timestamp()
        batch.setValue(batchTimeDate, forKey: "date");batch.setValue(receiptData.batchTotalArray, forKey: "totals")
        do {try managedContext.save()} catch {print("SaveFailed")}
        receiptData.itemArray = []
        receiptData.batchTotalArray = []
    }
    
    // Set the load array function for proof of Core Data loading
    @IBAction func loadArray() {
        let batchFetch = NSFetchRequest(entityName: "Batch")
        do {
            if let results = try managedContext.executeFetchRequest(batchFetch) as? [NSManagedObject] {
                batch = results[0]
                receiptData.batchTotalArray = batch.valueForKey("totals") as! [Float]
            }}catch{print("Load Failed")}}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
