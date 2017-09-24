//
//  FeedVC.swift
//  InstagramCloneF
//
//  Created by Sam Greenhill on 9/17/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class feedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func logoutPressed(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as! signUpVC
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = signUp
        delegate.rememberLogin()
    }
    
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    
    
    
}

