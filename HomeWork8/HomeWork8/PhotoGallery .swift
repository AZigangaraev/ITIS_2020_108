//
//  PhotoGallery .swift
//  HomeWork8
//
//  Created by Nail on 29.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import Foundation
import UIKit

class PhotoGallary{
    var images: [UIImage] = []
    init() {
        setupGallary()	
    }
    func setupGallary(){
        for i in 0...12{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
        
    }
}
