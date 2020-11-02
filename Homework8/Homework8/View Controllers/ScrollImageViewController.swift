//
//  ScrollImageViewController.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 01.11.2020.
//

import UIKit

class ScrollImageViewController: UIViewController, UIScrollViewDelegate {
    var image: UIImage!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        setZoomScale()
    }
    
    private func setZoomScale() {
        let size = image.size
        let widthScale = UIScreen.main.bounds.width / size.width
        let heightScale = UIScreen.main.bounds.height / size.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
        scrollView.maximumZoomScale = scale * 5
        
        let imageWidth = size.width * scale
        let imageHeight = size.height * scale
        let imageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        imageView.frame = imageFrame
        
        centerImage()
    }
    
    private func centerImage() {
        let screenSize = UIScreen.main.bounds
        imageView.frame.origin.x = imageView.frame.size.width < screenSize.width ? (screenSize.width - imageView.frame.size.width) / 2 : 0
        imageView.frame.origin.y = imageView.frame.size.height < screenSize.height ? (screenSize.height - imageView.frame.size.height) / 2 : 0
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
