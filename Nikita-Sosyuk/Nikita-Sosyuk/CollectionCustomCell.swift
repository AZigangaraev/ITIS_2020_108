//
//  CollectionCustomCell.swift
//  Nikita-Sosyuk
//
//  Created by Nikita Sosyuk on 01.11.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class CollectionCustomCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    
    func setImage(myImage: UIImage, size: Int) {
        imageView.image = myImage
        
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.contentMode = .scaleAspectFill
    }
    
}

