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
    private var cellSize: CGFloat?
    
    private var storiesDataSource: StoriesCollectionViewDataSource?
    private var imagesDataSource: ImagesCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storiesDataSource = StoriesCollectionViewDataSource()
        imagesDataSource = ImagesCollectionViewDataSource()
        storiesCollectionView.dataSource = storiesDataSource
        imagesCollectionView.dataSource = imagesDataSource
        storiesDataSource?.data = dataForStories
        imagesDataSource?.data = dataForImages
    }
    
    private var dataForImages: [UIImage] = [
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

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var value = UIScreen.main.bounds.width / 3 - 1
        if collectionView == storiesCollectionView {
            value = UIScreen.main.bounds.width / 5
            storiesDataSource?.cellSize = value
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
            image = dataForImages[indexPath.item]
        } else {
            image = dataForStories[indexPath.item]
        }
        
        let detailVC: DetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailVC") as! DetailViewController
        detailVC.beginAppearanceTransition(true, animated: false)
        detailVC.setupAppearance(image: image)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
