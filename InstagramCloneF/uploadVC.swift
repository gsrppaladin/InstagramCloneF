//
//  uploadVC.swift
//  InstagramCloneF
//
//  Created by Sam Greenhill on 9/17/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImage: UIImageView!
    
    @IBOutlet var postComments: UITextView!
    
    var uuid = NSUUID().uuidString
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.choosePhoto))
        postImage.addGestureRecognizer(recognizer)
        
        
    }

    
    @IBAction func postBtnPressed(_ sender: Any) {
        
        let mediaFolder = FIRStorage.storage().reference().child("media")
        
        if let data = UIImageJPEGRepresentation(postImage.image!, 0.5) {
            
            mediaFolder.child("\(uuid).jpg").put(data, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    let imageURL = metadata?.downloadURL()?.absoluteString
                    print(imageURL)
                    
                }
            })
            
        }
    }
    
    
    @objc func choosePhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

