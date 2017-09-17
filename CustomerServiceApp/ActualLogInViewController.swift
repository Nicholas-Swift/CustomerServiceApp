//
//  ActualLogInViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ActualLogInViewController: UIViewController {
    
    // MARK: - Instance Vars
    
    // MARK: - Subviews
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        passwordTextField.becomeFirstResponder()
    }
    
    // MARK: - Setup Views
    func setupViews() {
        closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }
    
    func tapCloseButton() {
        self.view.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    func tapLoginButton() {
        let initialViewController = MainFeedViewController.controllerFromNib()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
