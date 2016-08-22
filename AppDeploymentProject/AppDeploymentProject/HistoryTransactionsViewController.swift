//
//  HistoryTransactionsViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/16/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit
import CoreData

class HistoryTransactionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mox: NSManagedObjectContext!
    var moxDesc: NSEntityDescription!
    var savedBatches: [NSManagedObject] = []
    
    let fetchRequest = NSFetchRequest(entityName: "Receipt")
    let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
    
    var batchDates: [String] = []
    
    let sharedInstance = ReceiptData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mox = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        moxDesc = NSEntityDescription.entityForName("Receipt", inManagedObjectContext: mox)
        savedBatches = [NSManagedObject(entity: moxDesc, insertIntoManagedObjectContext: mox)]
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let results = try mox.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                for managedObject in results {
                    if let date = managedObject.valueForKey("date") {
                        if date as! String == sharedInstance.selectedBatch{
                            if let dateTime = managedObject.valueForKey("dateTime") {
                                batchDates.append(dateTime as! String)
                            }
//                        if date as! String == sharedInstance.selectedBatch {  
//                            batchDates.append(date as! String)
                        }
//                        print(date)
//                        batchDates.append(date as! String)
                    }
                }
//                print(batchDates)
                //                savedBatches = results
                //                print(savedBatches)
                //                batchDates = savedBatches
            }}catch{print("Load Failed")}

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batchDates.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repeatingCell", forIndexPath: indexPath)
        cell.textLabel!.text = batchDates[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sharedInstance.selectedReceipt = batchDates[indexPath.row]
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
