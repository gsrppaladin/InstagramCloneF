//
//  signUpVC.swift
//  InstagramCloneF
//
//  Created by Sam Greenhill on 9/17/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpVC: UIViewController {

    
    @IBOutlet var emailTxtField: UITextField!
    
    @IBOutlet var passwordTxt: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInPressed(_ sender: Any) {
        
        if emailTxtField.text != "" && passwordTxt.text != nil {
            
            FIRAuth.auth()?.signIn(withEmail: emailTxtField.text!, password: passwordTxt.text!, completion: { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    UserDefaults.standard.set(user?.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.rememberLogin()
                }
            })
        } else {
            let alert = UIAlertController(title: "Error", message: "Please Enter an Email and Password", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        if emailTxtField.text != "" && passwordTxt.text != "" {
            FIRAuth.auth()?.createUser(withEmail: emailTxtField.text!, password: passwordTxt.text!, completion: { (user, error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    UserDefaults.standard.set(user?.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.rememberLogin()
                    
                }
                
            })
        } else {
            let alert = UIAlertController(title: "Error", message: "Please Enter Your Email and Password", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        

        
    }
    
    
    
    

}
