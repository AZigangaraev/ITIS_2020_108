//
//  FullScreenViewController.swift
//  HomeWork8
//
//  Created by Nail on 30.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    var photoGallary:PhotoGallary!
    let cellCount = 1
    let identifier = "FullScreenCell"
    var indexPath:IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        collectionView.performBatchUpdates(nil) { (result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredVertically, animated: true)
           }
    }
    

}

extension FullScreenViewController: UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallary.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FullScreenCollectionViewCell
        cell.imageView.image = photoGallary.images[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(cellCount)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
