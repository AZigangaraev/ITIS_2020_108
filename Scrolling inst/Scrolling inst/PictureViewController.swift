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
    }
    
    func setImage(image: UIImage) {
        picture.image = image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return picture
    }
}
