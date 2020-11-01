//
//  UserDataView.swift
//  InstagramKnockOff
//
//  Created by Joseph on 01.11.2020.
//

import UIKit

class UserDataView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    let imageView = UIImageView(image: UIImage(named: "canoe")!)
    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        cv.backgroundColor = UIColor.gray
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.bounces = true
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)

        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(imageView)
        self.addSubview(collectionView)
        
        let dict = ["imageView": imageView, "collectionView": collectionView]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "CellID")
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]-[collectionView(50)]|", metrics: nil, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", metrics: nil, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", metrics: nil, views: dict))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! ImageCell
        
        if (indexPath.item * indexPath.row % 2 == 0) {
            cell.setImage(image: UIImage(named: "profile1")!)
        } else {
            cell.setImage(image: UIImage(named: "profile2")!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 3, height: self.frame.width)
    }
    
    
}
