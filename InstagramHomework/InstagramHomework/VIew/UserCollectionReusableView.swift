//
//  UserCollectionReusableView.swift
//  InstagramHomework
//
//  Created by Svetlana Safonova on 01.11.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class UserCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet var userPictureImageView: UIImageView! {
        didSet {
            userPictureImageView.layer.cornerRadius = 50
            userPictureImageView.clipsToBounds = true
            
        }
    }
    
    @IBOutlet var postsAmountLabel: UILabel!
    
    @IBOutlet var followingAmountLabel: UILabel!
    
    @IBOutlet var followersAmountLabel: UILabel!
    
    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var bioLabel: UILabel!
    
    @IBOutlet private var followButton: UIButton! {
        didSet {
            followButton.layer.cornerRadius = 3
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet private var messageButton: UIButton! {
        didSet {
            messageButton.layer.cornerRadius = 3
            messageButton.layer.borderWidth = 1
            messageButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet private var emailButton: UIButton! {
        didSet {
            emailButton.layer.cornerRadius = 3
            emailButton.layer.borderWidth = 1
            emailButton.layer.borderColor = UIColor.gray.cgColor
        }
    }

    
}
