//
//  ImagesViewHeader.swift
//  InstagramKnockOff
//
//  Created by Joseph on 01.11.2020.
//

import UIKit

class ImagesViewHeader: UICollectionReusableView {

    let button1: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = ImagesViewHeader.backgroundColor()
        bt.tintColor = ImagesViewHeader.tintColor()
        
        bt.contentMode = .center
        bt.setImage(UIImage(systemName: "pencil.slash")!, for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        
        return bt
    }()
    
    let button2: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = ImagesViewHeader.backgroundColor()
        bt.tintColor = ImagesViewHeader.tintColor()
                          
        bt.contentMode = .center
        bt.setImage(UIImage(systemName: "tray")!, for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        
        return bt
    }()
    
    let button3: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = ImagesViewHeader.backgroundColor()
        bt.tintColor = ImagesViewHeader.tintColor()

        
        bt.contentMode = .center
        bt.setImage(UIImage(systemName: "paperplane")!, for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        
        self.backgroundColor = .gray
        
        let oneThird = (self.frame.width - 8 * 3 )  / 3
        
        let dict = ["btn1": button1, "btn2": button2, "btn3": button3]
        let metrics = ["oneThird": oneThird]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[btn1(oneThird)]-3-[btn2(>=oneThird)]-3-[btn3(oneThird)]-|", metrics: metrics, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn1]|", metrics: metrics, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn2]|", metrics: metrics, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn3]|", metrics: metrics, views: dict))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func backgroundColor() -> UIColor {
        return UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
              return UIColor.darkGray
            default:
              return UIColor.white
            }
          }
    }
    
    private static func tintColor() -> UIColor {
        return UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
              return UIColor.white
            default:
              return UIColor.black
            }
          }
    }
}
