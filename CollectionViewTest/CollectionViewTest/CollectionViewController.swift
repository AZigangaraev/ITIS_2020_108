//
//  CollectionViewController.swift
//  CollectionViewTest
//
//  Created by Teacher on 26.10.2020.
//

import UIKit

class CollectionCustomCell: UICollectionViewCell {
    @IBOutlet private var label: UILabel!
    
    func set(text: String) {
        label.text = text
    }
}

class CollectionViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionCustomCell
        else { fatalError("Could not deque cell") }
        
        cell.set(text: "\(indexPath)" + (Bool.random() ? "\(self)" : ""))
        
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(indexPath)")
    }
}
