//
//  CustomTableViewCell.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 08/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var typeLabel:UILabel!
    @IBOutlet weak var imageThumbnail:UIImageView!
    @IBOutlet weak var preferredIconImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        
        preferredIconImageView.image = UIImage(named: "Heart.png")
        preferredIconImageView.hidden = true
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
