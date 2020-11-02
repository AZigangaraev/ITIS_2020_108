//
//  ImagesCollectionViewDataSource.swift
//  Homework7
//
//  Created by Олег Романов on 02.11.2020.
//

import UIKit

class ImagesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var data: [UIImage] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCustomCell
        let image = data[indexPath.item]
        cell?.setImageOfCollection(image: image)
        return cell ?? UICollectionViewCell()
    }
}
