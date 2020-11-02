//
//  CollectionReusableView.swift
//  InstagramProfile
//
//  Created by Rishat on 02.11.2020.
//

import UIKit

private let storiesImages: [UIImage] = [#imageLiteral(resourceName: "1_1.jpeg"), #imageLiteral(resourceName: "1_2.jpeg"), #imageLiteral(resourceName: "1_3.jpeg"), #imageLiteral(resourceName: "1_4.jpeg"), #imageLiteral(resourceName: "1_5.jpeg"), #imageLiteral(resourceName: "1_6.jpeg"), #imageLiteral(resourceName: "10")]
private let storiesLabel: [String] = ["alba", "lyapa", "rishat", "nikita", "misha", "milana", "bulat", "timoha"]

class CollectionReusableView: UICollectionReusableView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet private var profileImage: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var mainStackView: UIStackView!
    @IBOutlet private var editButton: UIButton!
    @IBOutlet private var storiesCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storiesCollection.showsHorizontalScrollIndicator = false
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        storiesCollection.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storiesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell
        else{
            fatalError("Could not deque cell")
        }
        cell.setData(image: storiesImages[indexPath.row], text: storiesLabel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (self.frame.size.width - 3) / 3
        return CGSize(width: length, height: length)
    }
}

//extension CollectionReusableView: UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        storiesCollection.deselectItem(at: indexPath, animated: true)
//    }
//}
//
//extension CollectionReusableView: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        storiesImages.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell
//        else{
//            fatalError("Could not deque cell")
//        }
//        cell.setData(image: storiesImages[indexPath.row], text: storiesLabel[indexPath.row])
//        return cell
//    }
//}
