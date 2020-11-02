//
//  CollectionStoryCell.swift
//  Nikita-Sosyuk
//
//  Created by Nikita Sosyuk on 01.11.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class CollectionStoryCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    func setData(myImage: UIImage, text: String) {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.contentMode = .scaleToFill
        imageView.image = myImage
        nameLabel.text = text
    }
    
}
