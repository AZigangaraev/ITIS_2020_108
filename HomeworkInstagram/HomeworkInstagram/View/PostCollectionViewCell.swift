//
//  PostCollectionViewCell.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 31.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "postCollectionViewCell"

    @IBOutlet private var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(_ image: UIImage) {
        postImageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: PostCollectionViewCell.self), bundle: nil)
    }

}
