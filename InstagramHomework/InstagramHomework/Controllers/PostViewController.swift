//
//  PostViewController.swift
//  InstagramHomework
//
//  Created by Svetlana Safonova on 02.11.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    var postImage: UIImage?
    
    var imageScrollView: ImageScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        setupImageScrollView()
              
//              let imagePath = Bundle.main.path(forResource: "Pic1", ofType: "jpg")!
//              let image = UIImage(contentsOfFile: imagePath)!
              
        if let image = postImage {
            self.imageScrollView.set(image: image)
        }
    }
    
    func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

    

}
