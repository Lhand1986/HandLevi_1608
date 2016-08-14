//
//  TillMainViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/9/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class TillMainViewController: UIViewController {

    @IBOutlet weak var calculateLabel: UILabel!
    
    @IBOutlet weak var numberPad: UIView!
    
    // Initialization of singleton
    let receiptItems = ReceiptData.sharedInstance
    
    var numberCheck: Bool = false
    
//    var decimalCheck: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - IBActions
    @IBAction func batchReport(sender: AnyObject) {
    }
    
    @IBAction func numberSelect(sender: AnyObject) {
        let buttonPress = sender.currentTitle!
        if numberCheck {
            calculateLabel!.text = calculateLabel!.text! + String(buttonPress!)
        } else {
            calculateLabel.text = String(buttonPress!)
            numberCheck = true
        }
    }
    @IBAction func addButton(sender: UIButton) {
        
        if let item = Float(calculateLabel.text!) {
            let testValue = floorf(item * 100) / 100
            receiptItems.itemArray.append(testValue)
            
            calculateLabel.text = nil
            numberCheck = false
        }
    }
    @IBAction func subButton(sender: UIButton) {
        //Perform optional chaining on calculateLabel, append the negative value to the receiptItems array
        if let item = calculateLabel.text {
            var testValue = floorf(Float(item)! * 100) / 100
            testValue = testValue - (testValue*2)
            receiptItems.itemArray.append(testValue)
            calculateLabel.text = nil
            numberCheck = false
        }
    }
    
    
    //MARK - User defined functions

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toReceipt" {
//            print(receiptItems.itemArray)
//            let receiptDestination = segue.destinationViewController as! TillReceiptViewController
        }
    }

}
