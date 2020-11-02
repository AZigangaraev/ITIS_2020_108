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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
        scrollView.contentSize = .init(width: 500, height: 500)
    }
    
    func setImage(image: UIImage) {
        imageView.image = image 
    }
    
    // MARK: -UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        viewDidLoad()
    }
}
