//
//  PhotoInfoViewController.swift
//  SooGreyhounds
//
//  Created by Fırat Karakuyu on 30.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!
    
    override func viewDidLoad() { super.viewDidLoad()
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
                case let .success(image):
                    self.imageView.image = image
                case let .failure(error):
                    print("Error fetching image for photo: \(error)")
            }
        }
    }
    
}
