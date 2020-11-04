//
//  StoriesCell.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 30.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class StoriesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    static let identifier = "storiesCell"
    
    var userStories: [Story] = []
    
    @IBOutlet private var storiesCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self
        self.storiesCollectionView.register(UINib(nibName: String(describing: StoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userStories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath as IndexPath) as! StoryCollectionViewCell
        cell.title = userStories[indexPath.row].title
        cell.photo = userStories[indexPath.row].photo
        return cell
    }
    
}
