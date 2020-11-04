//
//  Story.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 30.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class Story {
    var photo: UIImage
    var title: String
    
    init(photo: UIImage, title: String) {
        self.photo = photo
        self.title = title
    }
    
    convenience init() {
        self.init(photo: UIImage(), title: "")
    }
}
