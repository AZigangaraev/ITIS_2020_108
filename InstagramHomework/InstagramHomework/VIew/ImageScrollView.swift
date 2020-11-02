//
//  ImageScrollView.swift
//  InstagramHomework
//
//  Created by Svetlana Safonova on 02.11.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate {

    var imageZoomView: UIImageView!
          
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.delegate = self
            self.showsVerticalScrollIndicator = false
            self.showsHorizontalScrollIndicator = false
            self.decelerationRate = UIScrollView.DecelerationRate.normal
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func set(image: UIImage) {
              
              imageZoomView?.removeFromSuperview()
              imageZoomView = nil
              imageZoomView = UIImageView(image: image)
              self.addSubview(imageZoomView)
              
            configurateFor(imageSize: image.size)
          }
        
        func configurateFor(imageSize: CGSize){
            self.contentSize = imageSize
            
            setCurrentMaxandMinZoomScale()
            self.zoomScale = self.minimumZoomScale
    //        self.minimumZoomScale = 0.1
    //        self.maximumZoomScale = 5
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.centerImage()
        }
        
        func setCurrentMaxandMinZoomScale() {
            let boundsSize = self.bounds.size
            let imageSize = imageZoomView.bounds.size
            
            let xScale = boundsSize.width / imageSize.width
            let yScale = boundsSize.height / imageSize.height
            let minScale = min(xScale, yScale)
            
            var maxScale: CGFloat = 1.0
            if minScale < 0.1 {
                maxScale = 0.2
            }
            
            if minScale >= 0.1 && minScale < 0.9{
                maxScale = 0.33
            }
            
            if minScale > 0.5 {
                maxScale = max(1.2, minScale)
            }
            self.minimumZoomScale = minScale
            self.maximumZoomScale = maxScale
        }
        
        func centerImage() {
            let boundsSize = self.bounds.size
            var frameToCenter = imageZoomView?.frame ?? CGRect.zero
            
            if frameToCenter.size.width < boundsSize.width {
                frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
            } else {
                frameToCenter.origin.x = 0
            }
            
            if frameToCenter.size.height < boundsSize.height {
                frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
            } else {
                frameToCenter.origin.y = 0
            }
            
            imageZoomView.frame = frameToCenter
        }
        //MARK: - UIScrollViewDelegate

        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return self.imageZoomView
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            self.centerImage()
        }

}
