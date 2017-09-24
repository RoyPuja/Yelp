//
//  SwitchCell.swift
//  Yelp
//
//  Created by Roy, Puja on 9/23/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit


@objc protocol SwitchCellDelegate {
    @objc optional func switchCellToggled(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    
    @IBOutlet weak var filterSwitch: UISwitch!
    weak var delegate: SwitchCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        filterSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        delegate?.switchCellToggled?(switchCell: self, didChangeValue: filterSwitch.isOn)
    }

}
