//
//  ViewController.swift
//  QuickNotes
//
//  Created by Teacher on 26.10.2020.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPickerViewControllerDelegate {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private var notes: [Note] = []
    
    enum CellIdentifier: String {
        case textCell = "TextCell"
        case imageCell = "ImageCell"
    }
    
    // MARK: - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch notes[indexPath.row] {
        case .text(let text):
            return self.tableView(tableView, textCellForRowAt: indexPath, text: text)
        case .image(let image):
            return self.tableView(tableView, imageCellForRowAt: indexPath, image: image)
        }
    }
    
    func tableView(
        _ tableView: UITableView, textCellForRowAt indexPath: IndexPath, text: String
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.textCell.rawValue, for: indexPath) as? TextCell else {
            fatalError("Table view could not deque cell")
        }
        
        cell.set(text: text)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView, imageCellForRowAt indexPath: IndexPath, image: UIImage
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.imageCell.rawValue, for: indexPath) as? ImageCell
        else {
            fatalError("Table view could not deque cell")
        }
        
        cell.set(image: image)
        
        return cell
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch notes[indexPath.row] {
        case .text:
            return UITableView.automaticDimension
        case .image(let image):
            let size = image.size
            let maxWidth = tableView.bounds.size.width
                - tableView.layoutMargins.left
                - tableView.layoutMargins.right
            let maxHeight = size.height / size.width * maxWidth
            return min(maxHeight, 300)
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [ indexPath ], with: .automatic)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        let note = notes.remove(at: sourceIndexPath.row)
        notes.insert(note, at: destinationIndexPath.row)
    }
    
    // MARK: - PHPickerViewControllerDelegate
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    guard let self = self, let image = image as? UIImage else { return }
                    
                    self.notes.append(.image(image))
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func addTap() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Text", style: .default) { [weak self] _ in
            self?.addTextNote()
        })
        alertController.addAction(UIAlertAction(title: "Image", style: .default) { [weak self] _ in
            self?.showPhotosPicker()
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    private func addTextNote() {
        notes.append(.text(""))
        tableView.insertRows(at: [ IndexPath(row: notes.count - 1, section: 0) ], with: .automatic)
    }
    
    private func showPhotosPicker() {
        let pickerConfiguration = PHPickerConfiguration()
        let pickerController = PHPickerViewController(configuration: pickerConfiguration)
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction private func editTap() {
        tableView.isEditing.toggle()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: tableView.isEditing ? .done : .edit,
            target: self,
            action: #selector(editTap)
        )
    }
}

