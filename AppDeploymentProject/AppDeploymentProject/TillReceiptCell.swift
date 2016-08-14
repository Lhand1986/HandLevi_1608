//
//  TillReceiptCell.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/11/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class TillReceiptCell: UITableViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    
    //Initializer function that can be called to set the text value of the cell label
    func setupCell(item: String) {
        itemLabel.text = item
    }
}
