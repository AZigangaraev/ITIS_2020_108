//
//  ProfileDescriptionCell.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 29.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class ProfileDescriptionCell: UITableViewCell {
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    @IBOutlet private var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
