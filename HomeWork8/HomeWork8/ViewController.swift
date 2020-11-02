//
//  ViewController.swift
//  HomeWork8
//
//  Created by Nail on 26.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyCollectionView: UICollectionView!
    let photoGallary = PhotoGallary()
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var identifier = "ImageCollectionViewCell"
    let cellCount = 3
    let offset:CGFloat = 2.0
    var stories = [UIImage(named: "a"),UIImage(named: "b"),UIImage(named: "v"),UIImage(named: "g"),UIImage(named: "d")]
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        storyCollectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
  }
}

extension ViewController: UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return stories.count
        }else {
            return photoGallary.images.count
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case mainCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCollectionViewCell
            cell.imageView.image = photoGallary.images[indexPath.item]
            return cell
        case storyCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! StoryCollectionViewCell
            cell.storiesImage.image = stories[indexPath.item]
            return cell
        default:
            fatalError()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            let frameCV = collectionView.frame
            let widthCell = frameCV.width / CGFloat(cellCount)
            let heightCell = widthCell
            let spacing = CGFloat(CGFloat((cellCount * 1)) * offset / CGFloat(cellCount))
            return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
        }else {
            return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.width/3)
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallary = photoGallary
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
