//
//  Receipt.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/9/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import Foundation

/* Make a singleton that will allow the storage and cross-utilization of data */
class ReceiptData {
    static let sharedInstance = ReceiptData()
    var itemArray: [Float] = []
    var batchTotalArray: [Float] = []
    var taxes: Float = 0
    var subTotal: Float = 0
    var total: Float = 0
}