//
//  ProfileViewController.swift
//  HomeworkInstagram
//
//  Created by Ruslan Khanov on 28.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user = User()
    
    // MARK: - View identifiers
    
    private var headerViewId = "headerCollectionReusableView"
    
    private enum ProfileCellIdentifier: String {
        case head = "profileHeadCell"
        case subname = "subnameCell"
        case description = "descriptionCell"
        case buttons = "buttonsCell"
        
    }

    // MARK: - Outlets
    
    @IBOutlet private var postsCollectionView: UICollectionView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = UserData.getUser()
        loadProfileData()
        
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 328.0)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width / 3) - 1,
                                 height: (view.frame.size.width / 3) - 1)
        postsCollectionView.collectionViewLayout = layout
        
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        self.navigationItem.title = user.username
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    // MARK: - Table view configure
    
    private enum Cell {
        case head(photo: UIImage, postCount: Int, followersCount: Int, followingCount: Int)
        case subname(subname: String, categoryName: String)
        case description(description: String)
        case buttons
        case stories(_ stories: [Story])
    }
    
    private var cellData: [Cell]?
    
    private func loadProfileData() {
        if let description = user.description {
            cellData = [
                .head(photo: user.profilePhoto, postCount: user.postsCount, followersCount: user.followersCount, followingCount: user.followingCount),
                .subname(subname: user.subname, categoryName: user.categoryName ?? ""),
                .description(description: description),
                .buttons,
                .stories(user.stories)
            ]
        } else {
            cellData = [
                .head(photo: user.profilePhoto, postCount: user.postsCount, followersCount: user.followersCount, followingCount: user.followingCount),
                .subname(subname: user.subname, categoryName: user.categoryName ?? ""),
                .buttons,
                .stories(user.stories)
            ]
        }
    }
    
    private func configure(tableView: UITableView) {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: StoriesCell.self), bundle: nil), forCellReuseIdentifier: StoriesCell.identifier)
    }
    
    // MARK: - Helpers
    
    private func profileHeadCell(for indexPath: IndexPath, from tableView: UITableView, photo: UIImage, postsCount: Int, followersCount: Int, followingCount: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellIdentifier.head.rawValue, for: indexPath) as! ProfileHeadCell
        cell.photoImage = photo
        cell.postsCount = postsCount
        cell.followersCount = followersCount
        cell.followingCount = followingCount
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func profileSubnameCell(for indexPath: IndexPath, from tableView: UITableView, subname: String, categoryName: String) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellIdentifier.subname.rawValue, for: indexPath)
        cell.textLabel?.text = subname
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13.0, weight: .semibold)
        if categoryName != "" {
            cell.detailTextLabel?.text = categoryName
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13.0)
            cell.detailTextLabel?.textColor = .lightGray
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func profileDescriptionCell(for indexPath: IndexPath, from tableView: UITableView, description: String) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellIdentifier.description.rawValue, for: indexPath) as! ProfileDescriptionCell
        cell.descriptionText = description
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func profileButtonsCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellIdentifier.buttons.rawValue, for: indexPath) as! ProfileButtonsCell
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func storiesCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as! StoriesCell
        cell.userStories = user.stories
        
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Collection View Delegate

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let postViewController: PostViewController
                = storyboard?.instantiateViewController(identifier: "PostViewController")
        else { return }
        
        postViewController.loadViewIfNeeded()
        postViewController.postImage = user.posts[indexPath.row]
        show(postViewController, sender: nil)
    }
}

// MARK: - Collection View Data Source

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.postsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.setImage(user.posts[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewId, for: indexPath) as! ProfileHeaderView
        // Configuring table view
        configure(tableView: headerView.tableView)
        
        return headerView
    }
}

// MARK: - Table View Data Source / Table View Delegate

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cells = cellData else {
            fatalError()
        }
        
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cells = cellData else {
            fatalError()
        }
        
        switch cells[indexPath.row] {
        case .head(let photo, let postCount, let followersCount, let followingCount):
            return profileHeadCell(for: indexPath, from: tableView, photo: photo, postsCount: postCount, followersCount: followersCount, followingCount: followingCount)
        case .subname(let subname, let categoryName):
            return profileSubnameCell(for: indexPath, from: tableView, subname: subname, categoryName: categoryName)
        case .description(let description):
            return profileDescriptionCell(for: indexPath, from: tableView, description: description)
        case .buttons:
            return profileButtonsCell(for: indexPath, from: tableView)
        case .stories:
            return storiesCell(for: indexPath, from: tableView)
        default:
            fatalError("Non-implemented cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cells = cellData else {
            fatalError()
        }
        
        switch cells[indexPath.row] {
        case .stories:
            return 90.0
        default:
            return UITableView.automaticDimension
        }
    }
}
