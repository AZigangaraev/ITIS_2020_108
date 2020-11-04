//
//  ProfileButtonsCell.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 29.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class ProfileButtonsCell: UITableViewCell {

    @IBOutlet private var followButton: UIButton! {
        didSet {
            configure(button: followButton)
        }
    }
    @IBOutlet private var messageButton: UIButton! {
        didSet {
            configure(button: messageButton)
        }
    }
    @IBOutlet private var moreActionsButton: UIButton! {
        didSet {
            configure(button: moreActionsButton)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UI Helpers
    private func configure(button: UIButton) {
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .systemBackground
    }
}
