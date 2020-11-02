//
//  UserData.swift
//  InstagramHomework
//
//  Created by Svetlana Safonova on 01.11.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class UserData {
    
    var followersAmount: String
    var followingAmount: String
    var username: String
    var bio: String
    var profileImage: UIImage
    var posts: [UIImage] = []
    
    init(followersAmount: String, followingAmount: String, username: String, bio: String, profileImage: UIImage) {
        self.followersAmount = followersAmount
        self.followingAmount = followingAmount
        self.username = username
        self.bio = bio
        self.profileImage = profileImage
    }
    
    
}
