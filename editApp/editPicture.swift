//
//  editPicture.swift
//  editApp
//
//  Created by Reagan Becnel on 8/3/18.
//  Copyright © 2018 Reagan Becnel. All rights reserved.
//
//save button is tapped
    // go back to list and store all the details (pic, location, captiom, and date)
// view Did Load ()
    // show the picture 
import UIKit

class editPicture: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    var photoPicker = UIImagePickerController()
    
    @IBOutlet var locationText: UITextField!
    @IBOutlet var captionText: UITextField!
    @IBOutlet var dateText: UITextField!
    @IBOutlet var newImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        photoPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func camera(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibrary(_ sender: Any) {
        photoPicker.sourceType = .photoLibrary
        present(photoPicker, animated: true, completion: nil)
    }
    
   
    @IBAction func save(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let photoToSave = Photo(entity: Photo.entity(),insertInto: context)
            photoToSave.caption = captionText.text
            photoToSave.location = locationText.text
            photoToSave.date = dateText.text
            
            if let userImage = newImageView.image {
                if let userImageData = UIImagePNGRepresentation(userImage){
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
            }
        
   
    
        
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = (info[UIImagePickerControllerOriginalImage] as? UIImage) {
           newImageView.image = selectedImage
            
        }
       // dismiss(animated: true, completion: nil)
        
    }
    
}

}

    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



