//
//  feedCell.swift
//  InstagramCloneF
//
//  Created by Sam Greenhill on 10/8/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class feedCell: UITableViewCell {

    
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UITextView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
