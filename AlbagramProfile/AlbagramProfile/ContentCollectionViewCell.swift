//
//  ContentCollectionViewCell.swift
//  AlbagramProfile
//
//  Created by Albert Ahmadiev on 02.11.2020.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    func setData(img: UIImage, length: CGFloat) {
        contentImage.frame = CGRect(x: 0, y: 0, width: length, height: length)
        print(length)
        contentImage.contentMode = .scaleAspectFill
        contentImage.image = img
        contentImage.contentMode = .scaleAspectFill
    }
}
