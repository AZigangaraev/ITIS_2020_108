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
        scrollView.maximumZoomScale = 5.0
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    // MARK: -UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
