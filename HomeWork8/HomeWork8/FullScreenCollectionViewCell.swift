//
//  FullScreenCollectionViewCell.swift
//  HomeWork8
//
//  Created by Nail on 30.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }
}
