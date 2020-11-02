//
//  StoryCollectionViewCell.swift
//  HomeWork8
//
//  Created by Nail on 02.11.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var storiesImage: UIImageView!
    @IBOutlet weak var storyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        storiesImage.layer.cornerRadius = 30
        storiesImage.clipsToBounds = true
    }

}
