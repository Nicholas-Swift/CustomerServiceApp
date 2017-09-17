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
    var chats: [Chat] = []
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupModels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: false)
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
        navigationItem.title = "Dashboard"
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        // Table View
        tableView.register(ChatHeadTableViewCell.nib(), forCellReuseIdentifier: ChatHeadTableViewCell.toString())
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
    }
    
}

// MARK: - Setup Models
extension MainFeedViewController {
    
    func setupModels() {
        ChatService.getChats() { (chats: [Chat]) in
            self.chats = chats
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension MainFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController.controllerFromNib() as! ChatViewController
        let chat = chats[indexPath.row]
        chatViewController.setupModels(oldChat: chat)
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension MainFeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatHeadTableViewCell.toString(), for: indexPath)
            as! ChatHeadTableViewCell
        let chat = chats[indexPath.row]
        cell.setupModel(chat: chat)
        cell.setStylingSeen()
        return cell
    }
    
}
