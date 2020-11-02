//
//  ImageViewController.swift
//  Nikita-Sosyuk
//
//  Created by Nikita Sosyuk on 01.11.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    
    
    //тут была ошибка, видимо, в том что надо было использовать UIScreen.main - с ним работает, до этого брал у scrollView
    
    
    func setImage(image: UIImage) {
        imageView.image = image
        setZoomScale()
    }
    
    override func viewDidLoad() {
        scrollView.delegate = self
    }
    
    private func setZoomScale() {
        if let height = imageView.image?.size.height, let width = imageView.image?.size.width {
            let widthScale = UIScreen.main.bounds.width / width
            let heightScale = UIScreen.main.bounds.height / height
            let scale = min(widthScale, heightScale)
            
            scrollView.minimumZoomScale = scale
            scrollView.zoomScale = scale
            scrollView.maximumZoomScale = scale * 5

            let imageFrame = CGRect(x: 0, y: 0, width: width * scale, height: height * scale)
            imageView.frame = imageFrame
            
            center()
        }
    }
    
    private func center() {
        var frameToCenter = imageView.frame
        let boundsSize = UIScreen.main.bounds
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 3
        } else {
            frameToCenter.origin.x = 0
        }
        
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 3
        } else {
            frameToCenter.origin.y = 0
        }
        
        imageView.frame = frameToCenter
        
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        center()
    }
}
