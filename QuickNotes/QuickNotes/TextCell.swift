//
//  TextCell.swift
//  QuickNotes
//
//  Created by Teacher on 26.10.2020.
//

import UIKit

protocol TextCellDelegate: AnyObject {
    func textCell(_ textCell: TextCell, didChangeText: String)
}

class TextCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet private var textField: UITextField!
    
    weak var delegate: TextCellDelegate?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textCell(self, didChangeText: textField.text ?? "")
    }
    
    func set(text: String) {
        textField.text = text
    }
}
