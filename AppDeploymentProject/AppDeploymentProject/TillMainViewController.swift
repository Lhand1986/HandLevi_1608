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
    
    var receiptItems: [Float] = []
    
    var numberCheck: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - IBActions
    @IBAction func batchReport(sender: AnyObject) {
    }
    
    @IBAction func numberSelect(sender: AnyObject) {
        let buttonPress = sender.currentTitle!
        print(buttonPress!)
        if numberCheck {
            calculateLabel!.text = calculateLabel!.text! + String(buttonPress!)
        } else {
            calculateLabel.text = String(buttonPress!)
            numberCheck = true
        }
    }
    @IBAction func addButton(sender: UIButton) {
        
        if let item = Float(calculateLabel.text!) {
            receiptItems.append(item)
            print("Items: \(receiptItems)")
        }
    }
    @IBAction func subButton(sender: UIButton) {
    }
    
    
    //MARK - User defined functions
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
    }

}
