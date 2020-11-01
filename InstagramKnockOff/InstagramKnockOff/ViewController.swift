//
//  ViewController.swift
//  InstagramKnockOff
//
//  Created by Joseph on 29.10.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {

    private let collectionView: ImagesView = {
        return ImagesView(frame: CGRect.zero)
    }()

    private let userDataView: UserDataView = {
        return UserDataView(frame: CGRect.zero)
    }()

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor =
            UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.darkGray
                default:
                    return UIColor.white
                }
            }
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(collectionView)
        scrollView.addSubview(userDataView)

        self.view.addSubview(scrollView)

        let dict: [String: Any] = ["scrollView": scrollView, "collectionView": collectionView, "dataView": userDataView]

        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dataView]-[collectionView(>=1000)]|", metrics: nil, views: dict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dataView]|", metrics: nil, views: dict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", metrics: nil, views: dict))

        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 500),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            userDataView.heightAnchor.constraint(equalToConstant: 200),
            userDataView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", metrics: nil, views: dict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollView]-|", metrics: nil, views: dict))
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        scrollView.contentOffset.y += 80
//    }
}
