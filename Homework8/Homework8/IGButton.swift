//
//  IGButton.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 31.10.2020.
//

import UIKit

@IBDesignable class IGButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }

}
