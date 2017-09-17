//
//  SelfChatMessageTableViewCell.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ChatMessageSelfTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
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
extension ChatMessageSelfTableViewCell {
    
    func setupViews() {
        messageHighlightView.layer.cornerRadius = 8
    }
    
}

// MARK: - View Helpers
extension ChatMessageSelfTableViewCell {
    
    func set(text: String) {
        messageLabel.text = text
        messageLabel.sizeToFit()
    }
    
}
