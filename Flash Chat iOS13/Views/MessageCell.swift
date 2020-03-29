//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Muhammad Fawwaz Mayda on 29/03/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var meProfileImage: UIImageView!
    @IBOutlet weak var youProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
