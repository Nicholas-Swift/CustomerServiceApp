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
    var mainFeedSocketController: MainFeedSocketController!
    
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
        tableView.reloadData()
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

// MARK: - Main Feed Socket Controller
extension MainFeedViewController: MainFeedSocketControllerDelegate {
    
    func setupMainFeedSocketController() {
        mainFeedSocketController = MainFeedSocketController()
        mainFeedSocketController.delegate = self
    }
    
    func newChatWasAdded(chat: Chat) {
        
        // Need to see if already have chat.....
        for (index, currentChat) in chats.enumerated() {
            if chat.id == currentChat.id {
                chats.remove(at: index)
                break
            }
        }
        
        chats.insert(chat, at: 0)
        tableView.reloadData()
    }
    
}

// MARK: - Setup Models
extension MainFeedViewController {
    
    func setupModels() {
        ChatService.getChats() { (chats: [Chat]) in
            self.chats = chats
            self.tableView.reloadData()
            self.setupMainFeedSocketController()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension MainFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController.controllerFromNib() as! ChatViewController
        chats[indexPath.row].isUnread = false
        tableView.reloadRows(at: [indexPath], with: .none)
        chatViewController.setupModels(oldChat: chats[indexPath.row])
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
        if chat.isUnread {
            cell.setStylingUnseen()
        }
        return cell
    }
    
}
