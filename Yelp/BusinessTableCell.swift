//
//  BusinessTableCell.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/7/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessTableCell: UITableViewCell {
    
    /* Outlets */
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var businessDistanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var businessAddressLabel: UILabel!
    @IBOutlet weak var businessCategoriesLabel: UILabel!
    
    /* Properties */
    var business: Business!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialize() {
        businessImageView.setImageWith(business.imageURL!)
        businessNameLabel.text = business.name
        businessDistanceLabel.text = business.distance
        ratingImageView.setImageWith(business.ratingImageURL!)
        reviewCountLabel.text = business.reviewCount?.stringValue
        businessAddressLabel.text = business.address
        businessCategoriesLabel.text = business.categories
    }

}
