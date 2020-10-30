//
//  PhotoViewController.swift
//  InstagramItis
//
//  Created by Рустем on 30.10.2020.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    private var imageScrollView: ImageScrollView!
    
   var image: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        
        self.imageScrollView.set(image: image)
        
    }


    
 

}
