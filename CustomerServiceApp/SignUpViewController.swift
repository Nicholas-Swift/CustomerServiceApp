//
//  SignUpViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Subviews
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextView.becomeFirstResponder()
        
        closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        continueButton.layer.cornerRadius = 5
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Close button
    func tapCloseButton() {
        self.view.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
}
