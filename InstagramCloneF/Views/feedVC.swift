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
import FirebaseDatabase

class feedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet var tableView: UITableView!
    
    var userEmailArray = [String]()
    var postCommentArray = [String]()
    var postImageURLArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromServer()
    }

    func getDataFromServer() {
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded) { (snapshot) in
            
            
            let values = snapshot.value! as! NSDictionary
            let post = values["post"] as! NSDictionary
            
            
            let postIDs = post.allKeys
            
            for id in postIDs {
                let singlePost = post[id] as! NSDictionary
                self.userEmailArray.append(singlePost["postedby"] as! String)
                self.postCommentArray.append(singlePost["posttext"] as! String)
                self.postImageURLArray.append(singlePost["image"] as! String)
                
            }
            self.tableView.reloadData()
        
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCell
        
        cell.postText.text = postCommentArray[indexPath.row]
        cell.usernameLbl.text = userEmailArray[indexPath.row]
        
        return cell
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

