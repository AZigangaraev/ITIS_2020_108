//
//  StoryCollectionViewCell.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 30.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "storyCollectionViewCell"
    
    var title: String? {
        didSet {
            storyTitleLabel.text = title
        }
    }
    
    var photo: UIImage? {
        didSet {
            storyImageView.image = photo
        }
    }
    
    @IBOutlet private var storyTitleLabel: UILabel!
    @IBOutlet private var storyImageView: UIImageView! {
        didSet {
            storyImageView.layer.cornerRadius = storyImageView.bounds.width / 2
            storyImageView.clipsToBounds = true
        }
    }
    @IBOutlet private var borderView: UIView! {
        didSet {
            borderView.backgroundColor = .none
            borderView.layer.cornerRadius = borderView.bounds.width / 2
            borderView.clipsToBounds = true
            borderView.layer.borderWidth = 1.0
            borderView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
