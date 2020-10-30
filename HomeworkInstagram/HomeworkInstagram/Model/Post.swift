//
//  Post.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 29.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class Post {
    var photo: UIImage
    var description: String
    var likesCount: Int
    var postDate: String
    
    init(photo: UIImage, description: String, likesCount: Int, postDate: String) {
        self.photo = photo
        self.description = description
        self.likesCount = likesCount
        self.postDate = postDate
    }
    
    convenience init() {
        self.init(photo: UIImage(), description: "", likesCount: 0, postDate: "")
    }
}
