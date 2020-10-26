//
//  ImageCell.swift
//  QuickNotes
//
//  Created by Teacher on 26.10.2020.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet private var noteImageView: UIImageView!
    
    func set(image: UIImage) {
        noteImageView.image = image
    }
}
