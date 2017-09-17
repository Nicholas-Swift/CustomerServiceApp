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
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setStylingSeen()
    }
    
}

// MARK: - Setup Views
extension ChatHeadTableViewCell {
    
    func setupViews() {
        profilePictureImageView.backgroundColor = UIColor.csaAlmostWhite()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        profilePictureImageView.layer.borderColor = UIColor.csaAlmostWhite().cgColor
        profilePictureImageView.layer.borderWidth = 0.5
        profilePictureImageView.clipsToBounds = true
    }
    
}

// MARK: - Setup Models
extension ChatHeadTableViewCell {
    
    func setupModel(chat: Chat) {
        usernameLabel.text = chat.user.name
        messageLabel.text = chat.messages.last?.text
        timeLabel.text = chat.updatedAt.shortDateStringFromNow
    }
    
}

// MARK: - View Helpers
extension ChatHeadTableViewCell {
    
    func setStylingUnseen() {
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        messageLabel.font = UIFont.boldSystemFont(ofSize: 15)
        timeLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        usernameLabel.textColor = UIColor.csaBlack()
        messageLabel.textColor = UIColor.csaBlack()
        timeLabel.textColor = UIColor.csaBlack()
    }
    
    func setStylingSeen() {
        usernameLabel.font = UIFont.systemFont(ofSize: 17)
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        
        usernameLabel.textColor = UIColor.csaDarkText()
        messageLabel.textColor = UIColor.csaLightText()
        timeLabel.textColor = UIColor.csaLightText()
    }
    
}
