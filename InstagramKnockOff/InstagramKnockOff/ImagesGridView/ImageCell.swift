//
//  ImageCell.swift
//  InstagramKnockOff
//
//  Created by Joseph on 01.11.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {

    private let imageView: UIImageView = UIImageView(image: UIImage(named: "autumn")!)

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor =
            UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.darkGray
                default:
                    return UIColor.white
                }
            }

        setUpConstraints()
    }

    private func setUpConstraints() {
        self.addSubview(imageView)

        let dict: [String: Any] = ["image": imageView]
        let metrics: [String: Any] = ["quarter": self.frame.width]

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[image]-2-|", metrics: metrics, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[image]-2-|", metrics: metrics, views: dict))
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
