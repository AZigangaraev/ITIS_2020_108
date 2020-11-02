//
//  HeaderCollectionReusableView.swift
//  Scrolling inst
//
//  Created by Никита Ляпустин on 02.11.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    @IBOutlet var storyImageView: UIImageView!
    @IBOutlet var storyLabel: UILabel!
    
    func set(image: UIImage, text: String) {
        storyImageView.image = image
        storyLabel.text = text
        storyImageView.layer.cornerRadius = storyImageView.frame.height / 2
        storyImageView.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
    }
}

class HeaderCollectionReusableView: UICollectionReusableView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
      
    @IBOutlet var aboutProfileStackView: UIStackView!
    @IBOutlet var aboutPersonStackView: UIStackView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var storiesCollectionView: UICollectionView!
    
    private var stories: [Story]?
    
    override func awakeFromNib() {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        editProfileButton.layer.borderWidth = 1;
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        loadData()
        storiesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let story = stories?[indexPath.row]
        else { fatalError("Attempt to get data while it is not loaded") }
        
        return storyCell(for: indexPath, from: storiesCollectionView, story: story)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 70, height: 90)
    }
    
    private func storyCell(for indexPath: IndexPath, from collectionView: UICollectionView, story: Story) -> UICollectionViewCell {
        guard let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as? StoryCell else {
            fatalError("cannot create cell like StoryCell")
        }
        
        cell.set(image: story.image, text: story.text)
        
        return cell
    }
    
    //MARK: - Data
    
    struct Story {
        let image: UIImage
        let text: String
    }
    
    func loadData() {
        stories = [
            Story(image: #imageLiteral(resourceName: "frog1"), text: "Легушка"),
            Story(image: #imageLiteral(resourceName: "frog2"), text: "Лягушка"),
            Story(image: #imageLiteral(resourceName: "frog3"), text: "Frog"),
            Story(image: #imageLiteral(resourceName: "frog6"), text: "Фрог"),
            Story(image: #imageLiteral(resourceName: "frog4"), text: "Фрогич"),
            Story(image: #imageLiteral(resourceName: "frog5"), text: "Фроги"),
            Story(image: #imageLiteral(resourceName: "frog7"), text: "Лолгушка"),
            Story(image: #imageLiteral(resourceName: "frog8"), text: "Обезьянка")
        ]
    }
}

