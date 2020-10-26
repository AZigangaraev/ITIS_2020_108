//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Teacher on 26.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupKeyboardNotifications()
    }
    
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIApplication.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIApplication.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let size
                = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
                as? CGRect
        else { return }

        scrollView.contentInset.bottom = size.height
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
    }
}

