//
//  ChatMessageOtherTableViewCell.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ChatMessageOtherTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageHighlightView: UIView!

    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

// MARK: - Setup Views
extension ChatMessageOtherTableViewCell {
    
    func setupViews() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        profilePictureImageView.backgroundColor = UIColor.lightGray
        
        messageHighlightView.layer.cornerRadius = 8
    }
    
}

// MARK: - View Helpers
extension ChatMessageOtherTableViewCell {
    
    func set(text: String) {
        messageLabel.text = text
        messageLabel.sizeToFit()
    }
    
}
