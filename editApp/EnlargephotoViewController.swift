//
//  EnlargephotoViewController.swift
//  editApp
//
//  Created by Reagan Becnel on 8/7/18.
//  Copyright © 2018 Reagan Becnel. All rights reserved.
//

import UIKit

class EnlargephotoViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var enlargeImage: UIImageView!
    
    @IBOutlet weak var locationTitle: UILabel!
    
    @IBOutlet weak var dateTitle: UILabel!
    
    var photos : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ashdasdhaskdjhsakjdh")
//        print(photos!)
        if let realPhoto = photos  {
            print("ashdasdhaskdjhsakjdh")
            title = realPhoto.caption
            locationTitle.text = realPhoto.location
            dateTitle.text = realPhoto.date
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    backgroundImage.image = cellPhotoImage
                    enlargeImage.image = cellPhotoImage
                }
            }
        }
    }

}


