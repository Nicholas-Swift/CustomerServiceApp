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
    @IBOutlet weak var bottomRightImageView: UIImageView!

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
        self.selectionStyle = .none
        setupProfilePictureImageView()
        setupBottomRightImageView()
        messageHighlightView.layer.cornerRadius = 16
    }
    
    func setupProfilePictureImageView() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        profilePictureImageView.backgroundColor = UIColor.csaAlmostWhite()
    }
    
    func setupBottomRightImageView() {
        bottomRightImageView.backgroundColor = UIColor.csaAlmostWhite()
        bottomRightImageView.layer.cornerRadius = bottomRightImageView.bounds.width / 2
        bottomRightImageView.clipsToBounds = true
    }
    
}

// MARK: - Setup Models
extension ChatMessageOtherTableViewCell {
    
    func setupModel(message: Message, nextMessage: Message?) {
        set(text: message.text)
        bottomRightImageView.isHidden = true
        
        if let nextMessage = nextMessage {
            if nextMessage.fromUser {
                profilePictureImageView.isHidden = true
            }
        }
    }
    
    func set(text: String) {
        let attributedText = NSMutableAttributedString(string: text)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: text.characters.count))
        
        messageLabel.attributedText = attributedText
        messageLabel.sizeToFit()
    }
    
}
