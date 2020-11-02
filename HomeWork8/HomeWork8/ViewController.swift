//
//  ViewController.swift
//  HomeWork8
//
//  Created by Nail on 26.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let photoGallary = PhotoGallary()
    @IBOutlet weak var collectionView: UICollectionView!
    var identifier = "ImageCollectionViewCell"
    let cellCount = 3
    let offset:CGFloat = 2.0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
  }
}

extension ViewController: UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photoGallary.images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = photoGallary.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(cellCount)
        let heightCell = widthCell
        let spacing = CGFloat(CGFloat((cellCount * 1)) * offset / CGFloat(cellCount))
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallary = photoGallary
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
