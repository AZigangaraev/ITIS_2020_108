//
//  DetailViewController.swift
//  AlbagramProfile
//
//  Created by Albert Ahmadiev on 02.11.2020.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private var sv: UIScrollView!
    @IBOutlet private var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sv.delegate = self
    }
    
    func setData(image: UIImage) {
        img.image = image
        setMaxMinZoomScaleForCurrentBounds()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        img
    }
    
    func centerImage() {
        let screenSize = UIScreen.main.bounds
        img.frame.origin.x = img.frame.size.width < screenSize.width ? (screenSize.width - img.frame.size.width) / 3 : 0
        img.frame.origin.y = img.frame.size.height < screenSize.height ? (screenSize.height - img.frame.size.height) / 3 : 0
    }
    
    func setMaxMinZoomScaleForCurrentBounds() {
        if let size = img.image?.size {
            
            let widthScale = UIScreen.main.bounds.width / size.width
            let heightScale = UIScreen.main.bounds.height / size.height
            let scale = min(widthScale, heightScale)
            
            sv.minimumZoomScale = scale
            sv.zoomScale = scale
            sv.maximumZoomScale = scale * 5
            
            let imageWidth = size.width * scale
            let imageHeight = size.height * scale
            let imageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
            img.frame = imageFrame
            centerImage()
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
