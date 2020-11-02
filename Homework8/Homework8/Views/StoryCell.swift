//
//  StoryCell.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 02.11.2020.
//

import UIKit

class StoryCell: UICollectionViewCell {
    @IBOutlet private var borderView: UIView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let nibView = UINib(nibName: "StoryCell", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(nibView)
        borderView.layer.borderColor = UIColor.storyBorder.cgColor
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setText(_ text: String) {
        label.text = text
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            borderView.layer.borderColor = UIColor.storyBorder.cgColor
        }
    }
}
