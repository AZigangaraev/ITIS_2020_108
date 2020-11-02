//
//  IGButton.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 31.10.2020.
//

import UIKit

@IBDesignable class IGButton: UIButton {
    private var type: IGButtonType = .outlined
    
    @IBInspectable private var buttonTypeCode: Int = 0 {
        didSet { type = IGButtonType(rawValue: buttonTypeCode) ?? .outlined }
    }
    
    @IBInspectable private var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable private var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable private var cornerRadius: CGFloat = 0.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if type == .outlined && traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            borderColor = .buttonGrayBorder
        }
    }
}

enum IGButtonType: Int {
    case outlined = 0
    case filled = 1
}
