//
//  ViewController.swift
//  Nikita-Sosyuk
//
//  Created by Nikita Sosyuk on 30.10.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var data: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        self.navigationItem.title = "nktlckr"
        loadData()
    }
    
    func loadData() {
        for i in 10..<28 {
            data.append(UIImage(named: "\(i)") ?? #imageLiteral(resourceName: "9"))
        }
    }
    
    //MARK: -UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView", for: indexPath) as? CollectionReusableView
            else { fatalError("Could not deque header") }
        return profileHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMain", for: indexPath) as? CollectionCustomCell
            else { fatalError("Could not deque cell") }
        
        cell.setImage(myImage: data[indexPath.row], size: (Int) (self.view.frame.size.width) / 3)
        cell.contentMode = .scaleAspectFill
        
        return cell
    }
    
    // MARK: -UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let helper = (self.view.frame.size.width - 3) / 3
        return CGSize(width: helper, height: helper)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    1
    }
    
    // MARK: -UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let imageVC: ImageViewController
        = storyboard?.instantiateViewController(identifier: "ImageViewController")
        else { return }
        imageVC.loadViewIfNeeded()
        imageVC.setImage(image: data[indexPath.row])
        show(imageVC, sender: nil)
    }
}
