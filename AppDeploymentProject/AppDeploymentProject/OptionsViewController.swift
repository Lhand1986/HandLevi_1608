//
//  OptionsViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/16/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UITextFieldDelegate {
    
    let sharedInstance = ReceiptData.sharedInstance
    
    var printerDelegate: UIPrinterPickerControllerDelegate!

    @IBOutlet weak var taxField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Push the tax multiplier through the shared instance, and save the tax multiplier to the defaults of the device.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let taxText = Float(taxField.text!) {
            sharedInstance.taxMultiplier = Float(taxText)
            sharedInstance.setTaxes(taxText)
        }
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    //Allow the print button to call the necessary function to select a printer
    @IBAction func printButton(sender: UIButton) {
        sharedInstance.printerSelect()
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
