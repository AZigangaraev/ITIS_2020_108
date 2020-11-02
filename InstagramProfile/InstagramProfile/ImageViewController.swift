//
//  ImageViewController.swift
//  InstagramProfile
//
//  Created by Rishat on 02.11.2020.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var zoomImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    func setImage(image: UIImage) {
        zoomImage.image = image
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomImage
    }
    
    
}
