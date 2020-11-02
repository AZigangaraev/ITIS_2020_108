//
//  CollectionReusableView.swift
//  AlbagramProfile
//
//  Created by Albert Ahmadiev on 02.11.2020.
//

import UIKit

private let storiesImages: [UIImage] = [#imageLiteral(resourceName: "0.jpg"), #imageLiteral(resourceName: "1.jpg"), #imageLiteral(resourceName: "2.jpg"), #imageLiteral(resourceName: "3.jpg"), #imageLiteral(resourceName: "4.jpg"), #imageLiteral(resourceName: "5.jpg"), #imageLiteral(resourceName: "6.jpg"), #imageLiteral(resourceName: "7.jpg"), #imageLiteral(resourceName: "8.jpg"), #imageLiteral(resourceName: "9.jpg"), #imageLiteral(resourceName: "10.jpg")]
private let storiesTxts: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]

class CollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var editProfileLabel: UILabel!
    
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    @IBOutlet public var profileImage: UIImageView!
    
    override func awakeFromNib() {
        storiesCollectionView.showsHorizontalScrollIndicator = false
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.borderWidth = 1
    }
}

extension CollectionReusableView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        storiesCollectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension CollectionReusableView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storiesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell
        else{
            fatalError("stories")
        }
        cell.setData(img: storiesImages[indexPath.row], txt: storiesTxts[indexPath.row])
        return cell
    }
}

extension CollectionReusableView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
