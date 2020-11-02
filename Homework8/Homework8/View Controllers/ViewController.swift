//
//  ViewController.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 31.10.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, PhotoCellDelegate {
    
    @IBOutlet private var collectionView: UICollectionView!
    private var photos: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        photos = ImageLoader.loadFiles()
        collectionView.register(ProfileInfoView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileInfoView")
        // Отдельный хэдер для TabView, чтобы он мог «прилипать» к верхней части экрана при скролле
        collectionView.register(UINib(nibName: "TabView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TabView")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
    }
    
    // MARK: - UICollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 1) {
            return photos.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { fatalError("Could not dequeue cell") }
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
            switch indexPath.section {
            case 0:
                return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileInfoView", for: indexPath)
            case 1:
                return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TabView", for: indexPath)
            default:
                break
            }
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 330)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 60)
        default:
            fatalError()
        }
    }
    
    // MARK: - PhotoCellDelegate
    
    func showPhoto(_ image: UIImage) {
        let scrollImageViewVC: ScrollImageViewController = storyboard!.instantiateViewController(identifier: "ScrollImageViewController")
        scrollImageViewVC.image = image
        navigationController?.pushViewController(scrollImageViewVC, animated: true)
    }
}
