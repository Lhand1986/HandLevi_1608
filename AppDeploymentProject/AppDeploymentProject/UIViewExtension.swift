//
//  UIViewExtension.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/21/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

//Extension inspiration from Jiri Trecak on StackOverflow in regards to converting a UIView
//to UIImage for the purposes of data processing over printer
extension UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}