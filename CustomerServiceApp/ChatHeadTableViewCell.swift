//
//  ChatHeadTableViewCell.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ChatHeadTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setStylingSeen()
    }
    
}

// MARK: - Setup Views
extension ChatHeadTableViewCell {
    
    func setupViews() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        profilePictureImageView.backgroundColor = UIColor.lightGray
    }
    
}

// MARK: - View Helpers
extension ChatHeadTableViewCell {
    
    func setStylingUnseen() {
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        messageLabel.font = UIFont.boldSystemFont(ofSize: 15)
        timeLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        usernameLabel.textColor = UIColor.black
        messageLabel.textColor = UIColor.black
        timeLabel.textColor = UIColor.black
    }
    
    func setStylingSeen() {
        usernameLabel.font = UIFont.systemFont(ofSize: 17)
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        
        usernameLabel.textColor = UIColor.black
        messageLabel.textColor = UIColor.lightGray
        timeLabel.textColor = UIColor.lightGray
    }
    
}
