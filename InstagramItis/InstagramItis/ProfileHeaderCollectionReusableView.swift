//
//  ProfileHeaderCollectionReusableView.swift
//  InstagramItis
//
//  Created by Рустем on 30.10.2020.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var storCollectionView: UICollectionView!
    
    private var images: [UIImage]!
    let n = 20;
    let nameStroriesCell = "storiesCellID"
    private var mainController: UIViewController!
    
    
    
    func set(image: [UIImage], main : UIViewController){
        
        mainController = main
        images = image
        
        storCollectionView?.dataSource = self
        storCollectionView?.delegate = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal

        storCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return n;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameStroriesCell, for: indexPath) as! StoriesCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 80, height: 80)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let photoViewController = storyboard.instantiateViewController(identifier: "goPhoto") as! PhotoViewController
        photoViewController.image = images[indexPath.item]
                
        mainController.show(photoViewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
    }

   
    
    
}
