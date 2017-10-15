//
//  DetailCell.swift
//  Research
//
//  Created by Siyang Liu on 2017/8/17.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
