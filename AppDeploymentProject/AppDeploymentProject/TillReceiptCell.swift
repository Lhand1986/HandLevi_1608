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
    
    
    func setupCell(item: String) {
        itemLabel.text = item
    }
}
