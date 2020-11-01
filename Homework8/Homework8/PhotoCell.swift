//
//  PhotoCell.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 01.11.2020.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    weak var delegate: PhotoCellDelegate?
    
    func set(photo: UIImage) {
        imageView.image = photo
    }
    
    @IBAction private func cellTapped(_ sender: Any) {
        delegate?.showPhoto(imageView.image!)
    }
}

class PhotoCellControl: UIControl {
    override var isHighlighted: Bool {
        didSet { alpha = isHighlighted ? 0.6 : 1.0 }
    }
}

protocol PhotoCellDelegate: AnyObject {
    func showPhoto(_ image: UIImage)
}
