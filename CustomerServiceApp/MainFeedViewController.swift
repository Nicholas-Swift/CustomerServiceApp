//
//  MainFeedViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class MainFeedViewController: UIViewController {
    
    // MARK: - Instance Vars
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: animated)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - Setup Views
extension MainFeedViewController {
    
    func setupViews() {
        
        // Navigation Item
        navigationItem.title = "Main Feed"
        
        // Table View
        tableView.register(ChatHeadTableViewCell.nib(), forCellReuseIdentifier: ChatHeadTableViewCell.toString())
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
    }
    
}

// MARK: - UITableViewDelegate
extension MainFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController.controllerFromNib()
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension MainFeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatHeadTableViewCell.toString(), for: indexPath)
            as! ChatHeadTableViewCell
        cell.profilePictureImageView.image = TESTprofilePicture()
        cell.setStylingSeen()
        return cell
    }
    
}

// MARK: - TEST DATA
extension MainFeedViewController {
    
    func TESTprofilePicture() -> UIImage {
        let possibleImages = ["brianhans", "nickswift", "rinniswift"]
        return UIImage(named: possibleImages.random())!
    }
    
}
