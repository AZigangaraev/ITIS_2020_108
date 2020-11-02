//
//  CollectionViewController.swift
//  AlbagramProfile
//
//  Created by Albert Ahmadiev on 02.11.2020.
//

import UIKit

private let reuseIdentifier = "ContentCollectionViewCell"

public let images: [UIImage] = [#imageLiteral(resourceName: "0.jpg"), #imageLiteral(resourceName: "1.jpg"), #imageLiteral(resourceName: "2.jpg"), #imageLiteral(resourceName: "3.jpg"), #imageLiteral(resourceName: "4.jpg"), #imageLiteral(resourceName: "5.jpg"), #imageLiteral(resourceName: "6.jpg"), #imageLiteral(resourceName: "7.jpg"), #imageLiteral(resourceName: "8.jpg"), #imageLiteral(resourceName: "9.jpg"), #imageLiteral(resourceName: "10.jpg")]

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private var length : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        length = (self.view.frame.width - 3) / 3
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ContentCollectionViewCell else {
            fatalError("content")
        }
        cell.setData(img: images[indexPath.row], length: length)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView", for: indexPath) as? CollectionReusableView
        else{
            fatalError("content")
        }
        
        return headerView
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailViewController: DetailViewController
                =   storyboard?.instantiateViewController(identifier: "DetailViewController")
        else { return }
        
        detailViewController.loadViewIfNeeded()
        detailViewController.setData(image: images[indexPath.row])
        show(detailViewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: length, height: length)
    }
}
