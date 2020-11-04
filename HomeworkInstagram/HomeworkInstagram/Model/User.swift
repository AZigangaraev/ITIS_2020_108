//
//  User.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 29.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

typealias Post = UIImage

class User {
    var username: String
    var subname: String
    var categoryName: String?
    var description: String?
    var profilePhoto: UIImage
    var followersCount: Int
    var followingCount: Int
    
    var posts: [Post] = []
    var stories: [Story] = []
    
    var postsCount: Int { posts.count }
    var storiesCount: Int { stories.count }
    
    init(username: String, subname: String, profilePhoto: UIImage, followersCount: Int, followingCount: Int) {
        self.username = username
        self.subname = subname
        self.profilePhoto = profilePhoto
        self.followersCount = followersCount
        self.followingCount = followingCount
    }
    
    convenience init() {
        self.init(username: "", subname: "", profilePhoto: UIImage(), followersCount: 0, followingCount: 0)
    }
    
    func setCategoryName(_ categoryName: String) {
        self.categoryName = categoryName
    }
    
    func setDescription(_ description: String) {
        self.description = description
    }
}
