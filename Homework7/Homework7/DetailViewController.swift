//
//  DetailViewController.swift
//  Homework7
//
//  Created by Олег Романов on 01.11.2020.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private var scrollView: UIScrollView!
    
    @IBOutlet private var detailImage: UIImageView!
    
// MARK: - Internal methods
    
    func setupAppearance(image: UIImage) {
        self.detailImage.image = image
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.contentSize = detailImage.frame.size
    }
    
    // Понимаю, лишний код лучше убирать, но этот я оставил себе на память :)
    
//    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
    // Когда-то оно возвращало картинку к исходному размеру...
//        scrollView.setZoomScale(1.0, animated: true)
//        print("\(scrollView.zoomScale)")
//    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return detailImage
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        navigationController?.navigationBar.isHidden = true
    }
}
