//
//  ProfileViewController.swift
//  Scrolling inst
//
//  Created by Никита Ляпустин on 01.11.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet private var cellImageView: UIImageView!
    
    func setImage(image: UIImage, sideOfPictureCell: Double) {
        cellImageView.image = image
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.frame = CGRect(x: 0, y: 0, width: sideOfPictureCell, height: sideOfPictureCell)
    }
}

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var picturesCollectionView: UICollectionView!
    var sideOfPictureCell: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideOfPictureCell = Double((self.view.frame.size.width - 3) / 3)
        loadData()
    }
    
    //MARK: - Data
    
    var pictures: [UIImage]?
    
    func loadData() {
        pictures = [#imageLiteral(resourceName: "circle1.jpg"), #imageLiteral(resourceName: "circle2.jpg"), #imageLiteral(resourceName: "circle3.jpg"), #imageLiteral(resourceName: "mine1.png"), #imageLiteral(resourceName: "mine2.jpg"), #imageLiteral(resourceName: "mine3.jpg"), #imageLiteral(resourceName: "mine4.jpg"), #imageLiteral(resourceName: "mine5.jpg"), #imageLiteral(resourceName: "mine6.jpg"), #imageLiteral(resourceName: "mine7.jpg"), #imageLiteral(resourceName: "mine8.png"), #imageLiteral(resourceName: "mine9.jpg"), #imageLiteral(resourceName: "mine10.jpg"), #imageLiteral(resourceName: "mine11.png"), #imageLiteral(resourceName: "mine12.png"), #imageLiteral(resourceName: "mine13.jpg"), #imageLiteral(resourceName: "mine14.jpg"), #imageLiteral(resourceName: "mine15.jpg"), #imageLiteral(resourceName: "mine16.jpg")]
    }
    
    //MARK: - Pictures Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictures?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let picture = pictures?[indexPath.row] else { fatalError("Attempt to get data while it is not loaded") }
        
        return pictureCell(for: indexPath, from: picturesCollectionView, picture: picture)
    }
    
    private func pictureCell(for indexPath: IndexPath, from collectionView: UICollectionView, picture: UIImage) -> UICollectionViewCell {
        guard let cell = picturesCollectionView.dequeueReusableCell(withReuseIdentifier: "imageCellNew", for: indexPath) as? PictureCell else {
            fatalError("cannot create cell like imageCellNew")
        }
        
        cell.setImage(image: picture, sideOfPictureCell: sideOfPictureCell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: sideOfPictureCell, height: sideOfPictureCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = picturesCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView else {
            fatalError("Cannot create header")
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pictureViewController: PictureViewController = storyboard?.instantiateViewController(identifier: "PictureViewController") else { return }
        guard let picture = pictures?[indexPath.row] else {
            fatalError("")
        }
        
        pictureViewController.loadViewIfNeeded()
        pictureViewController.setImage(image: picture)
        show(pictureViewController, sender: nil)
    }
}
