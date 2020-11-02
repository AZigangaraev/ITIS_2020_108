//
//  UserDataView.swift
//  InstagramKnockOff
//
//  Created by Joseph on 01.11.2020.
//

import UIKit

class UserDataView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    //private let imageView = UIImageView(image: UIImage(named: "canoe")!)

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UserDataView.backgroundColor()

        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(
            top: view.topAnchor, paddingTop: 50,
            width: 120, height: 120)
        profileImageView.layer.cornerRadius = 60

        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor)

        view.addSubview(emailLabel)
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.anchor(top: nameLabel.bottomAnchor)

        return view
    }()

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profile2")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Eddie Brock"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = textColor()
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "venom@gmail.com"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = textColor()
        return label
    }()

    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        cv.backgroundColor = backgroundColor()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.bounces = true

        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)

        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(containerView)
        self.addSubview(collectionView)

        let dict = ["containerView": containerView, "collectionView": collectionView]

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "CellID")

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView(300)][collectionView(50)]|", metrics: nil, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", metrics: nil, views: dict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", metrics: nil, views: dict))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! ImageCell

        if indexPath.item * indexPath.row % 2 == 0 {
            cell.setImage(image: UIImage(named: "profile1")!)
        } else {
            cell.setImage(image: UIImage(named: "profile2")!)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 3, height: self.frame.width)
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

    private static func textColor() -> UIColor {
        return UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    }

    private static func buttonColor() -> UIColor {
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

extension UIView {

    func anchor(
        top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
        paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil
    ) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }

        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }

        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
