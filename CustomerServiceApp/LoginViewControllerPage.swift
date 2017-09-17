//
//  LoginViewControllerPage.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class LoginViewControllerPage: UIViewController {
    
    // MARK: - Instance Vars
    var pageIndex: Int!
    var titles = ["Welcome to Customer Service App",
                  "Easy dashboard.\nDo it the easy way!",
                  "Secure and correct",
                  "Stay on top of your product.\nAnytime. Anywhere."]
    var subtitles = ["Swipe to learn more",
                     "All your feedback, whether text, email, or more, will be aggregated on this dashboard for you.",
                     "Once you sign up, you are given a phone number and email to give out to customers to sign up for.",
                     "Nice bro"]
    
    // MARK: - Subviews
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoSubtitleLabel: UILabel!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Setup Views
extension LoginViewControllerPage {
    
    func setupViews(pageIndex: Int) {
        self.pageIndex = pageIndex
        
        infoTitleLabel.text = titles[pageIndex]
        infoSubtitleLabel.text = subtitles[pageIndex]
        
        infoTitleLabel.textColor = UIColor.csaDarkText()
        infoSubtitleLabel.textColor = UIColor.csaLightText()
    }
    
}
