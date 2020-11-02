//
//  ProfileInfoView.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 02.11.2020.
//

import UIKit

class ProfileInfoView: UICollectionReusableView, UICollectionViewDataSource {
    
    @IBOutlet private var storiesCollectionView: UICollectionView!
    private var photos: [UIImage]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let nibView = UINib(nibName: "ProfileInfoView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        nibView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: nibView.frame.height)
        addSubview(nibView)
        storiesCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        storiesCollectionView.dataSource = self
        photos = ImageLoader.loadFiles()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as? StoryCell else { fatalError("Could not dequeue cell") }
        cell.setImage(photos[indexPath.item])
        cell.setText("Story #\(indexPath.item + 1)")
        return cell
    }
}
