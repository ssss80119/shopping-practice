//
//  NewTableViewCell.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/26.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var newtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newtitle.layer.masksToBounds = true
        newtitle.layer.cornerRadius = 5
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
