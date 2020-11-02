//
//  ProfileTopView.swift
//  Nikita-Sosyuk
//
//  Created by Nikita Sosyuk on 01.11.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ProfileTopView: UIView, UICollectionViewDataSource {

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var button: UIButton!
    @IBOutlet private var storiesCollection: UICollectionView!
    
    private var data: [CellData] = []
    
    override func awakeFromNib() {
        profileImageView.image = #imageLiteral(resourceName: "9")
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        button.layer.cornerRadius = 10
        storiesCollection.showsHorizontalScrollIndicator = false 
        loadData()
    }
    
    // MARK: -HelperData
    
    func loadData() {
        for i in 1..<10 {
            data.append(CellData(title: "№\(i)", image: UIImage(named: "\(i)") ?? #imageLiteral(resourceName: "9")))
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Story", for: indexPath) as? CollectionStoryCell
        else { fatalError("Could not deque cell") }
        
        cell.setData(myImage: data[indexPath.row].image, text: data[indexPath.row].title)
        
        return cell
    }

}
