//
//  ViewController.swift
//  InstagramProfile
//
//  Created by Rishat on 01.11.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentImage: UIImageView!
    
    func setData(image: UIImage) {
        
        contentImage.image = image
        
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    public let images: [UIImage] = [#imageLiteral(resourceName: "1_4"), #imageLiteral(resourceName: "1.jpg"), #imageLiteral(resourceName: "2.jpg"), #imageLiteral(resourceName: "3.jpg"), #imageLiteral(resourceName: "4.jpg"), #imageLiteral(resourceName: "5.jpg"), #imageLiteral(resourceName: "6.jpg"), #imageLiteral(resourceName: "7.jpg"), #imageLiteral(resourceName: "8.jpg"), #imageLiteral(resourceName: "9.jpg"), #imageLiteral(resourceName: "10.jpg"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "1_1"), #imageLiteral(resourceName: "16"), #imageLiteral(resourceName: "14"), #imageLiteral(resourceName: "1_3"), #imageLiteral(resourceName: "1_4"), #imageLiteral(resourceName: "1_3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            fatalError("Could not deque cell")
        }
        cell.setData(image: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView", for: indexPath) as? CollectionReusableView
        else{
            fatalError("Could not deque cell")
        }
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (self.view.frame.size.width - 3) / 3
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let imageViewController: ImageViewController = storyboard?.instantiateViewController(identifier: "ImageViewController") else { return }
        guard image = images[indexPath.row] else {
            fatalError("")
        }
        
        imageViewController.loadViewIfNeeded()
        imageViewController.setImage(image: image)
        show(imageViewController, sender: nil)
    }
} 
