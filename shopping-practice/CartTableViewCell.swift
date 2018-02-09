//
//  CartTableViewCell.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/24.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cerllPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

