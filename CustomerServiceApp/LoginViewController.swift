//
//  LoginViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class LoginViewController: UIPageViewController {

    // MARK: - Instance Vars
    var viewControllerPages: [LoginViewControllerPage] = []
    
    // MARK: - Subviews
    var pageControl: UIPageControl!
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(UIColor.csaWhite(), for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setupPages()
        self.setViewControllers([viewControllerPages[0]], direction: .forward, animated: false, completion: nil)
        
        self.delegate = self
        self.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Setup page control
        pageControl = view.subviews.filter{ $0 is UIPageControl }.first! as! UIPageControl
        pageControl.backgroundColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        setupButtons()
    }

}

// MARK: - Login Button
extension LoginViewController {
    
    func setupButtons() {
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: 0),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            loginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32)])
        
        self.view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -4),
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32)])
    }
    
    func tapSignUpButton() {
        
    }
    
    func tapLogInButton() {
        
    }
    
}

// MARK: - Pages
extension LoginViewController {
    
    func setupPages() {
        for i in 0..<4 {
            let loginViewControllerPage = LoginViewControllerPage.controllerFromNib() as! LoginViewControllerPage
            loginViewControllerPage.setupViews(pageIndex: i)
            viewControllerPages.append(loginViewControllerPage)
        }
    }
    
}

// MARK: - UIPageViewControllerDelegate
extension LoginViewController: UIPageViewControllerDelegate {
    
}

// MARK: - UIPageViewControllerDataSource
extension LoginViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentPageIndex: Int = (viewController as! LoginViewControllerPage).pageIndex
        let newPageIndex = currentPageIndex - 1
        return newPageIndex >= 0 ? viewControllerPages[newPageIndex] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentPageIndex: Int = (viewController as! LoginViewControllerPage).pageIndex
        let newPageIndex = currentPageIndex + 1
        return newPageIndex <= viewControllerPages.count - 1 ? viewControllerPages[newPageIndex] : nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerPages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
