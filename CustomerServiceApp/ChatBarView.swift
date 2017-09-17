//
//  ChatBarView.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ChatBarView: UIView {
    
    // MARK: - Subviews
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textTextField: UITextField!
    
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup Views
extension ChatBarView {
    
    func setupViews() {
        textTextField.delegate = self
    }
    
}

// MARK: - UITextFieldDelegate
extension ChatBarView: UITextFieldDelegate {
    
    
    
}
