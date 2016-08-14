//
//  TillBatchViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/13/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class TillBatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    let receiptData = ReceiptData.sharedInstance
    var dayTotal: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        if receiptData.batchTotalArray.count > 0 {
            for i in 0..<receiptData.batchTotalArray.count {
                dayTotal = dayTotal + receiptData.batchTotalArray[i]
            }
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
