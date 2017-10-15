//
//  HeadlineCell.swift
//  News
//
//  Created by Siyang Liu on 2017/10/14.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class HeadlineCell: UITableViewCell {
    
    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
