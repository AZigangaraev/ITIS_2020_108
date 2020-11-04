//
//  UserData.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 31.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class UserData {
    
    static func getUser() -> User {
        var user = User()
        
        user = User(username: "dirtyjesuss", subname: "yung hope", profilePhoto: #imageLiteral(resourceName: "profile_photo"), followersCount: 666, followingCount: 1)
        user.setCategoryName("Art")
        user.setDescription("ран away")
        
        // Adding stories
        let stories: [Story] = [
            Story(photo: UIImage(named: "story1") ?? UIImage(), title: "me"),
            Story(photo: UIImage(named: "story2") ?? UIImage(), title: "walk"),
            Story(photo: UIImage(named: "story3") ?? UIImage(), title: "moments"),
            Story(photo: UIImage(named: "story4") ?? UIImage(), title: "study"),
            Story(photo: UIImage(named: "story5") ?? UIImage(), title: "love"),
            Story(photo: UIImage(named: "story6") ?? UIImage(), title: "food"),
            Story(photo: UIImage(named: "story7") ?? UIImage(), title: "car"),
            Story(photo: UIImage(named: "story8") ?? UIImage(), title: "shopping")
        ]
        user.stories = stories
        
        // Adding posts
        for i in 1...20 {
            user.posts.append(UIImage(named: "post\(i)") ?? UIImage())
        }
        
        return user
    }
}
