//
//  ImageZoomView.swift
//  InstagramKnockOff
//
//  Created by Joseph on 02.11.2020.
//

import UIKit

class ImageZoomViewController: UIViewController {
    private var imageZoomView: ImageZoomView?
    private var image: UIImage?
    
    override func viewDidLoad() {
        self.imageZoomView = ImageZoomView(frame: self.view.frame, image: image!)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.view.addSubview(imageZoomView!)
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
}

class ImageZoomView: UIScrollView, UIScrollViewDelegate {
    
    private var imageView: UIImageView!
    private var gestureRecognizer: UITapGestureRecognizer!
    
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        
        // Creates the image view and adds it as a subview to the scroll view
        imageView = UIImageView(image: image)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        setupScrollView(image: image)
        //setupGestureRecognizer()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let dict = ["imageView": imageView!]
            
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[imageView]-200-|", metrics: nil, views: dict))
    }
    
    func setupScrollView(image: UIImage) {
        delegate = self
        
        minimumZoomScale = 1.0
        maximumZoomScale = 2.0
    }
    
    func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width = imageView.frame.size.width / scale
        let newCenter = convert(center, from: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
