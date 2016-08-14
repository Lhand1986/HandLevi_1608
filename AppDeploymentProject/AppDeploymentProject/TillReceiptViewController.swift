//
//  TillReceiptViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/11/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class TillReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var receiptTable: UITableView!
    
    //Initialization of singleton
    let receiptItems = ReceiptData.sharedInstance
    var receiptSubtotal: Float! = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(receiptItems.itemArray)
        for i in 0..<receiptItems.itemArray.count {
            receiptSubtotal = receiptSubtotal + receiptItems.itemArray[i]
        }
        subTotalLabel.text = String(receiptSubtotal)
        
        /* 
         taxesLabel.text = String(receiptSubtotal / taxes)
         totalLabel.text = String(taxes + receiptSubtotal)
         */
        
        print(receiptItems.itemArray.count)
//        receiptTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func printButton(sender: AnyObject) {
        //Save totals out for use in the batch report on print
        print(Float(receiptSubtotal))
        receiptItems.batchTotalArray.append(receiptSubtotal)
        
    }
    @IBAction func cancelButton(sender: AnyObject) {
        receiptItems.itemArray = []
        clearItems()
//        receiptTable.reloadData()
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
