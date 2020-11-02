//
//  StoriesCollectionViewCell.swift
//  InstagramItis
//
//  Created by Рустем on 31.10.2020.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var label: UILabel!

  func set(image: UIImage, text: String) {
    imageView.image = image
    imageView.contentMode = .scaleAspectFill
    label.text = text
  }
}
