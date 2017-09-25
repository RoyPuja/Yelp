//
//  FilterCell.swift
//  Yelp
//
//  Created by Roy, Puja on 9/24/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    
    @IBOutlet weak var buttonDown: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
