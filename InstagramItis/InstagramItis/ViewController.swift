//
//  ViewController.swift
//  InstagramItis
//
//  Created by Рустем on 29.10.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

  @IBOutlet weak private var photosCollectionView: UICollectionView!
  private var ProfileHeader: ProfileHeaderCollectionReusableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    photosCollectionView?.delegate = self
    photosCollectionView?.dataSource = self
    loadData()
  }

  var images: [UIImage] = []
  var imagesStories: [(UIImage, String)] = []
  let namePhotoCell = "cellID"

  private func loadData() {
    for i in 1...20 {
      let im = UIImage(named: "\(i)")!
      images.append(im)
      imagesStories.append((im, "\(i)"))
    }
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell =
      collectionView.dequeueReusableCell(withReuseIdentifier: namePhotoCell, for: indexPath)
      as! PhotosCollectionViewCell
    cell.imageView.image = images[indexPath.item]
    cell.imageView.contentMode = .scaleAspectFill
    cell.layer.shouldRasterize = true
    cell.layer.rasterizationScale = UIScreen.main.scale
    return cell
  }

  func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
  sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(
      width: (UIScreen.main.bounds.width / 3) - 7, height: (UIScreen.main.bounds.width / 3) - 7)
  }

  func collectionView( _ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath) -> UICollectionReusableView {
    let cell =
      collectionView.dequeueReusableSupplementaryView(
        ofKind: kind, withReuseIdentifier: "profileHeader", for: indexPath)
      as! ProfileHeaderCollectionReusableView
    cell.set(image: imagesStories, main: self)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let photoViewController =
      storyboard.instantiateViewController(identifier: "goPhoto") as! PhotoViewController
    photoViewController.set(image: images[indexPath.item])
    show(photoViewController, sender: nil)
  }

}
