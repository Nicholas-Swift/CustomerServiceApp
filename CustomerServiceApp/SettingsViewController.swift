//
//  SettingsViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Instance Vars
    @IBOutlet weak var closeBarButtonItem: UIBarButtonItem!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBarButtonItem.action = #selector(didTapCloseButton)
    }
    
    func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
