//
//  CheckViewController.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/24/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit
import TesseractOCR

class CheckViewController: UIViewController, G8TesseractDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var checkImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Implementing Tesseract required framework
        let tesseract:G8Tesseract = G8Tesseract(language:"eng")
        tesseract.delegate = self
        let camera = UIImagePickerController()
        camera.sourceType = UIImagePickerControllerSourceType.Camera
        camera.allowsEditing = false
        self.presentViewController(camera, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false
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
