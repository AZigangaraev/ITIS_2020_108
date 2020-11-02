//
//  ImageLoader.swift
//  Homework8
//
//  Created by Robert Mukhtarov on 01.11.2020.
//

import UIKit

struct ImageLoader {
    static func loadFiles() -> [UIImage] {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var images: [UIImage] = []
        let files = try! fm.contentsOfDirectory(atPath: path)
        for file in files {
            if file.hasSuffix("jpg") {
                images.append(UIImage(named: file)!)
            }
        }
        return images
    }
}
