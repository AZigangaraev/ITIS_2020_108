//
//  StoriesCollectionViewDataSource.swift
//  Homework7
//
//  Created by Олег Романов on 02.11.2020.
//

import UIKit

class StoriesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var data: [UIImage] = []
    
    var cellSize: CGFloat = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCell", for: indexPath) as? ImageCustomCell
        let image = data[indexPath.item]
        cell?.setImageOfStories(image: image)
        cell?.storiesStyle(size: cellSize)
        return cell ?? UICollectionViewCell()
    }
    
    
}
