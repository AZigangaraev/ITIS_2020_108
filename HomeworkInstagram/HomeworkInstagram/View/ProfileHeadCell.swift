//
//  ProfileHeadCell.swift
//  HomeworkInstagram
//xs
//  Created by Ruslan Khanov on 29.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class ProfileHeadCell: UITableViewCell {
    
    var photoImage: UIImage? {
        didSet {
            photoImageView.image = photoImage
        }
    }
    
    var postsCount: Int? {
        didSet {
            postsCountLabel.text = String(postsCount!)
        }
    }
    
    var followersCount: Int? {
        didSet {
            followersCountLabel.text = String(followersCount!)
        }
    }
    
    var followingCount: Int? {
        didSet {
            followingCountLabel.text = String(followingCount!)
        }
    }

    @IBOutlet private var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
            photoImageView.clipsToBounds = true
        }
    }
    @IBOutlet private var postsCountLabel: UILabel!
    @IBOutlet private var followersCountLabel: UILabel!
    @IBOutlet private var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
