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
    
    var numberArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiptItems.getDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - IBActions
    @IBAction func batchReport(sender: AnyObject) {
    }
    // Create a function that will allow the number pressed to display on the calculateLabel in the appropriate location
    @IBAction func numberSelect(sender: AnyObject) {
        let buttonPress = sender.currentTitle!
        numberArray.append(String(buttonPress!))
        if numberCheck {
            calculateLabel!.text = calculateLabel!.text! + String(buttonPress!)
        } else {
            calculateLabel.text = String(buttonPress!)
            numberCheck = true
        }
    }
    
    /*Adding in function to properly handle removal of a character from the calculation
     by taking the string in the label, breaking it into an array of characters, removing
     the last character from the array, and then resetting the displayed label values to
     reflect the proper sequence of the updated array.*/
    @IBAction func delButton(sender: AnyObject) {
        if calculateLabel.text != nil {
            var tempString = Array(calculateLabel.text!.characters)
            tempString.removeLast(1)
            calculateLabel.text = ""
            for num in 0..<tempString.count {
                calculateLabel.text = calculateLabel.text! + String(tempString[num])
            }
        }
    }
    
    
    // Set function that will append the displayed value to the receiptItems array
    @IBAction func addButton(sender: UIButton) {
        if let item = Float(calculateLabel.text!) {
            let testValue = floorf(item * 100) / 100
            receiptItems.itemArray.append(testValue)
            calculateLabel.text = nil
            numberCheck = false
        }
    }
    // Set function that will append the displayed value to the receiptItems array as a negative value
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
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        }
//    }

}
