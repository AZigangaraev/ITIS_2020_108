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
            roundCorners(of: followButton)
        }
    }
    @IBOutlet private var messageButton: UIButton! {
        didSet {
            roundCorners(of: messageButton)
        }
    }
    @IBOutlet private var moreActionsButton: UIButton! {
        didSet {
            roundCorners(of: moreActionsButton)
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
    private func roundCorners(of button: UIButton) {
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
    }
}
