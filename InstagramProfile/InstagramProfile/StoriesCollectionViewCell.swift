//
//  StoriesCollectionViewCell.swift
//  InstagramProfile
//
//  Created by Rishat on 02.11.2020.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storiesImageView: UIImageView!
    @IBOutlet weak var storiesLabel: UILabel!
    
    public func setData(image: UIImage, text: String) {
        storiesImageView.layer.cornerRadius = storiesImageView.frame.height / 2
        storiesImageView.contentMode = .scaleToFill
        storiesImageView.image = image
        storiesLabel.text = text
    }
}
