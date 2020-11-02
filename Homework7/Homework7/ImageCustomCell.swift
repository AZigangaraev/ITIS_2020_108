//
//  ImageCustomCell.swift
//  Homework7
//
//  Created by Олег Романов on 30.10.2020.
//

import UIKit

class ImageCustomCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var storiesImageView: UIImageView!
    
    func setImageOfCollection(image: UIImage) {
        imageView.image = image
    }
    
    func setImageOfStories(image: UIImage) {
        storiesImageView.image = image
    }
    
    func storiesStyle(size: CGFloat) {
        storiesImageView.layer.cornerRadius = size / 2
    }
}
