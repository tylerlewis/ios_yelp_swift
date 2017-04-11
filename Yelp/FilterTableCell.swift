//
//  FilterTableCell.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

protocol FilterSwitchCellDelegate: class {
    func filterSwitchCellDidToggle(cell: FilterTableCell, newValue: Bool)
}

class FilterTableCell: UITableViewCell {
    
    @IBOutlet weak var filterItemLabel: UILabel!
    @IBOutlet weak var filterItemSwitch: UISwitch!
    
    weak var delegate: FilterSwitchCellDelegate?
    
    var filterRowIdentifier: FilterItem? {
        didSet {
            filterItemLabel.text = filterRowIdentifier?.text
            filterItemSwitch.isOn = filterRowIdentifier?.isOn ?? false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
//        filterItemSwitch.addTarget(self, action: #selector(onToggleSwitch), for: UIControlEvents.valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didToggleSwitch(_ sender: Any) {
        delegate?.filterSwitchCellDidToggle(cell: self, newValue: filterItemSwitch.isOn)
    }
    
}
