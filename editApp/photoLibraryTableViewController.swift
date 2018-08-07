//
//  photoLibraryTableViewController.swift
//  editApp
//
//  Created by Reagan Becnel on 8/3/18.
//  Copyright © 2018 Reagan Becnel. All rights reserved.
//

import UIKit
struct CellData {
    let image : UIImage?
    let message : String?
}
class photoLibraryTableViewController: UITableViewController {

    var data = [CellData]()
    var photos : [Photo] = []
    
    
    func getPhotos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                if let unwrappedPhotos = coreDataPhotos {
                    photos = unwrappedPhotos
                    tableView.reloadData()
                }
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption


        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage
            }
            
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEnlargePhoto", sender: [photos[indexPath.row]])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEnlargePhoto" {
            if let photoDetailView = segue.destination as? EnlargephotoViewController {
                
                if let photoToSend = sender as? Photo {
                    photoDetailView.photo = photoToSend
                }
                }
        }
        
    }
    
}
