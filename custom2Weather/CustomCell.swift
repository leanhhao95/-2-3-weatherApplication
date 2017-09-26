//
//  CustomCell.swift
//  custom2Weather
//
//  Created by Hao on 9/26/17.
//  Copyright © 2017 Hao. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
