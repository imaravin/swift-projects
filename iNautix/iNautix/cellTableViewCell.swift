//
//  cellTableViewCell.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 09/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var time2: UILabel!
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
