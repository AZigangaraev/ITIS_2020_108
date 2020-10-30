

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate {

    var imageZoomView: UIImageView!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
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
    
    func configurateFor(imageSize: CGSize) {
        self.contentSize = imageSize
        
        self.maximumZoomScale = 5
        self.minimumZoomScale = 1 / (imageZoomView.frame.size.width / UIScreen.main.bounds.width)
        
        self.zoomScale = 1 / (imageZoomView.frame.size.width / UIScreen.main.bounds.width)
        
        print()
        
        self.imageZoomView.isUserInteractionEnabled = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageZoomView.frame.origin.x = (self.bounds.size.width - imageZoomView.frame.size.width)/2
        imageZoomView.frame.origin.y = (self.bounds.size.height - imageZoomView.frame.size.height)/2

    }
  


    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageZoomView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        imageZoomView.frame.contains(CGPoint(x: 0, y: (self.bounds.size.width - imageZoomView.frame.size.width)/2 ))
    }
    
}
