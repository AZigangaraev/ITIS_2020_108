//
//  ViewController.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 31.10.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, PhotoCellDelegate {
        
    @IBOutlet var collectionView: UICollectionView!
    private var photos: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        loadFiles()
        collectionView.register(UINib(nibName: "ProfileInfoView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileInfoView")
    }
    
    private func loadFiles() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var images: [UIImage] = []
        let files = try! fm.contentsOfDirectory(atPath: path)
        for file in files {
            if file.hasSuffix("jpg") {
                images.append(UIImage(named: file)!)
            }
        }
        photos = images
    }
    
    // MARK: - UICollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell
        else { fatalError("Could not dequeue cell")}
        cell.set(photo: photos[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(UIScreen.main.bounds.width)
        let side = width / 3 - 1
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileInfoView", for: indexPath)
            return headerView
        } else {
            fatalError("Wrong kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 280)
    }
    
    // MARK: - PhotoCellDelegate
    
    func showPhoto(_ image: UIImage) {
        let scrollImageViewVC: ScrollImageViewController = storyboard!.instantiateViewController(identifier: "ScrollImageViewController")
        scrollImageViewVC.image = image
        navigationController?.pushViewController(scrollImageViewVC, animated: true)
    }
}

