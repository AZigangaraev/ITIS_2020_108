//
//  ViewController.swift
//  InstagramHomework
//
//  Created by Svetlana Safonova on 01.11.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet private var picturesCollectionView: UICollectionView!
    
    var pictureCell: PictureCollectionViewCell!
    
    var user: UserData?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = UserData(followersAmount: "1", followingAmount: "1", username: "u better fucking run", bio: "You're gonna meet the world now, and I think you'll love it", profileImage: UIImage(named: "profile") ?? UIImage())
        
        for i in 1...19{
            user?.posts.append(UIImage(named: "Pic\(i)") ?? UIImage())
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = picturesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 257)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let itemSize = view.frame.size.width/3-1
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let user = user {
            return user.posts.count
        }
        else {
            fatalError()
        }
        
    }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! PictureCollectionViewCell
        cell.pictureImageView.image = user?.posts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let userHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "userview", for: indexPath) as! UserCollectionReusableView
        if let user = user {
        userHeadView.usernameLabel.text = user.username
        userHeadView.bioLabel.text = user.bio
        userHeadView.userPictureImageView.image = user.profileImage
        userHeadView.followersAmountLabel.text = user.followersAmount
        userHeadView.followingAmountLabel.text = user.followingAmount
        userHeadView.postsAmountLabel.text = "\(user.posts.count)"
        }
        else {
            fatalError()
        }
        return userHeadView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showpost" {
            guard let indexPath = picturesCollectionView.indexPathsForSelectedItems?.first else {fatalError()}
            
            let destination = segue.destination as! PostViewController
            
            destination.postImage = user?.posts[indexPath.row]
            
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let postViewController = storyboard?.instantiateViewController(identifier: "PostViewController") as! PostViewController
//        postViewController.loadViewIfNeeded()
//        postViewController.postImage = user?.posts[indexPath.row]
//        
//        show(postViewController, sender: nil)
//    }
    
}

