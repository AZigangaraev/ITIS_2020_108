//
//  ViewController.swift
//  Homework7
//
//  Created by Олег Романов on 30.10.2020.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet private var storiesCollectionView: UICollectionView!
    @IBOutlet private var imagesCollectionView: UICollectionView!
    private let storiesCollectionViewIdentifier = "StoriesCell"
    private let imagesCollectionViewIdentifier = "ImageCell"
    private var cellSize: CGFloat?
    
    private var data: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
        UIImage(named: "11")!,
        UIImage(named: "12")!,
        UIImage(named: "13")!,
        UIImage(named: "14")!,
        UIImage(named: "15")!,
        UIImage(named: "16")!,
        UIImage(named: "17")!,
        UIImage(named: "18")!,
        UIImage(named: "19")!,
        UIImage(named: "20")!,
        UIImage(named: "21")!
    ]
    
    private var dataForStories: [UIImage] = [
        UIImage(named: "s1")!,
        UIImage(named: "s2")!,
        UIImage(named: "s3")!,
        UIImage(named: "s4")!,
        UIImage(named: "s5")!,
    ]
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count: Int
        switch collectionView {
        case imagesCollectionView:
            count = data.count
            break
        case storiesCollectionView:
            count = dataForStories.count
            break
        default:
            count = 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image: UIImage
        if collectionView == imagesCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCollectionViewIdentifier, for: indexPath) as? ImageCustomCell
            image = data[indexPath.item]
            cellA?.setImageOfCollection(image: image)
                
            return cellA ?? UICollectionViewCell()
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: storiesCollectionViewIdentifier, for: indexPath) as? ImageCustomCell
            image = dataForStories[indexPath.item]
            cellB?.setImageOfStories(image: image)
            cellB?.storiesStyle(size: cellSize ?? CGFloat(0))
            
            return cellB ?? UICollectionViewCell()
        }
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var value = UIScreen.main.bounds.width / 3 - 1
        if collectionView == storiesCollectionView {
            value = UIScreen.main.bounds.width / 5
            cellSize = value
        }
        return CGSize(width: value, height: value)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == imagesCollectionView {
            return 1
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image: UIImage
        if collectionView == imagesCollectionView {
            image = data[indexPath.item]
        } else {
            image = dataForStories[indexPath.item]
        }
        
        let detailVC: DetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailVC") as! DetailViewController
        detailVC.beginAppearanceTransition(true, animated: false)
        detailVC.setupAppearance(image: image)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
