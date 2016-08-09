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
    
    //MARK - User defined functions
    
    //MARK: Touch Handling
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            print(touch.locationInView(numberPad))
            print(touch.description)
        }
    }
    
    
    //Touch function
//    func updateTouches(touches: Set<UITouch>) {
//        for touch in touches {
//            print(touch.locationInView(<#T##view: UIView?##UIView?#>))
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
