//
//  BusinessCell.swift
//  Yelp
//
//  Created by Roy, Puja on 9/22/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

   
    @IBOutlet weak var ratingsImageView: UIImageView!
    @IBOutlet weak var thumbnailImgeView: UIImageView!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reveiwsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var business: Business! {
        didSet{
            nameLabel.text = business.name
            categoryLabel.text = business.categories
            addressLabel.text = business.address
            reveiwsLabel.text = "\(business.reviewCount!) Reviews"
            distanceLabel.text = business.distance
            if let url = business.imageURL {
                thumbnailImgeView.setImageWith(url)
            }
            ratingsImageView.setImageWith(business.ratingImageURL!)
            amountLabel.text="$$"
        }
        
          
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnailImgeView.layer.cornerRadius=3
        thumbnailImgeView.clipsToBounds=true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

