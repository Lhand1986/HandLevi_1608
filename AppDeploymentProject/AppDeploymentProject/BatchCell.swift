//
//  BatchCell.swift
//  AppDeploymentProject
//
//  Created by Levi Hand on 8/13/16.
//  Copyright © 2016 Levi Hand. All rights reserved.
//

import UIKit

class BatchCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item: String) {
        itemLabel.text = item
    }

}
