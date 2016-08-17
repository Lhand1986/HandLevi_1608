//
//  ReceiptObject.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/16/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit
import CoreData

class ReceiptObject: NSManagedObject {
    @NSManaged var date: NSDate?
    @NSManaged var items: [Float]?
}
