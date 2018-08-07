//
//  EnlargephotoViewController.swift
//  editApp
//
//  Created by Reagan Becnel on 8/7/18.
//  Copyright © 2018 Reagan Becnel. All rights reserved.
//

import UIKit

class EnlargephotoViewController: UIViewController {

    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var enlargedPhoto: UIImageView!
    var photo : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let realPhoto = photo{
            title = realPhoto.caption
        
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData)
                {
                    backgroundPhoto.image = cellPhotoImage
                    enlargedPhoto.image = cellPhotoImage
                }
            }
            }
        }

        // Do any additional setup after loading the view.
    }

    



