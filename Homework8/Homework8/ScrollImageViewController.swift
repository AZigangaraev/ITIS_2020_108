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
        scrollView.contentSize = image.size
        setZoomScale(for: image.size)
    }
    
    override func viewDidLayoutSubviews() {
        centerImage()
    }
    
    private func setZoomScale(for size: CGSize) {
        let widthScale = scrollView.frame.width / size.width
        let heightScale = scrollView.frame.height / size.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
        scrollView.maximumZoomScale = scale * 5
        
        let imageWidth = size.width * scale
        let imageHeight = size.height * scale
        let newImageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        imageView.frame = newImageFrame
        
        centerImage()
    }
    
    private func centerImage() {
        let screenSize = scrollView.frame.size
        var imageViewFrame = imageView.frame
        imageViewFrame.origin.x = imageViewFrame.size.width < screenSize.width ? (screenSize.width - imageViewFrame.size.width) / 2 : 0
        imageViewFrame.origin.y = imageViewFrame.size.height < screenSize.height ? (screenSize.height - imageViewFrame.size.height) / 2 : 0
        imageView.frame = imageViewFrame
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
