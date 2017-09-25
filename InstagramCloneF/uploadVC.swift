//
//  uploadVC.swift
//  InstagramCloneF
//
//  Created by Sam Greenhill on 9/17/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImage: UIImageView!
    
    @IBOutlet var postComments: UITextView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.choosePhoto))
        postImage.addGestureRecognizer(recognizer)
        
        
    }

    
    @IBAction func postBtnPressed(_ sender: Any) {
        
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

