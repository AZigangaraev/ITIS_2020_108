//
//  StoriesCollectionViewCell.swift
//  AlbagramProfile
//
//  Created by Albert Ahmadiev on 02.11.2020.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storieImageView: UIImageView!
    @IBOutlet weak var storieLabel: UILabel!
    
    public func setData(img: UIImage, txt: String) {
        storieImageView.layer.cornerRadius = storieImageView.frame.height / 2
        storieImageView.layer.borderWidth = 1
        storieImageView.image = img
        storieLabel.text = txt
    }
}
