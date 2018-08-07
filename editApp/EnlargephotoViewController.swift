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
        if let realPhoto = photo {
            title = realPhoto.caption
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
