//
//  PictureViewController.swift
//  Scrolling inst
//
//  Created by Никита Ляпустин on 02.11.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var picture: UIImageView!
    
    override func viewDidLoad() {
        scrollView.delegate = self
        centerImage()
    }
    
    func setImage(image: UIImage) {
        picture.image = image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return picture
    }
    
    func setCurrentMaxandMinZoomScale() {
        let boundsSize = self.view.bounds.size
        let imageSize = picture.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxScale: CGFloat = 1.0
        if minScale < 0.1 {
            maxScale = 0.3
        }
        if minScale >= 0.1 && minScale < 0.5 {
            maxScale = 0.7
        }
        if minScale >= 0.5 {
            maxScale = max(1.0, minScale)
        }
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = maxScale
    }

    
    func centerImage() {
        let boundsSize = self.scrollView.bounds.size
        var frameToCenter = picture.frame
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
        } else {
            frameToCenter.origin.x = 0
        }
        
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
        } else {
            frameToCenter.origin.y = 0
        }
        
        picture.frame = frameToCenter
    }
}
