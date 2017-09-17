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
        setupViews()
    }
}

// MARK: - Setup Views
extension ChatBarView {
    
    func setupViews() {
        setupBlur()
        textTextField.delegate = self
    }
    
    func setupBlur() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        let visualEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: visualEffect)
        visualEffectView.frame = self.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(visualEffectView, at: 0)
    }
    
}

// MARK: - UITextFieldDelegate
extension ChatBarView: UITextFieldDelegate {
    
    
    
}
