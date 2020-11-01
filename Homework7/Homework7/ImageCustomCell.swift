//
//  ImageCustomCell.swift
//  Homework7
//
//  Created by Олег Романов on 30.10.2020.
//

import UIKit

class ImageCustomCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    
    func set(image: UIImage) {
        imageView.image = image
    }
}
