//
//  PostViewController.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 01.11.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIScrollViewDelegate {
    
    var postImage: UIImage? {
        didSet {
            postImageView.image = postImage
        }
    }
    
    @IBOutlet private var postImageView: UIImageView!
    @IBOutlet private var postScrollView: UIScrollView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postScrollView.delegate = self
        postScrollView.minimumZoomScale = 1.0
        postScrollView.maximumZoomScale = 5.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return postImageView
    }
}
