//
//  ChatViewController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: - Instance Vars
    var messages: [Message] = []
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatBarViewPlaceholder: UIView!
    var chatBarView: ChatBarView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModels()
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - Setup Models
extension ChatViewController {
    
    func setupModels() {
        self.messages = TESTmessages()
    }
    
}

// MARK: - Setup Views
extension ChatViewController {
    
    func setupViews() {
        setupNavigationItem()
        setupTableView()
        setupChatBarView()
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Brian Hans"
    }
    
    func setupTableView() {
        tableView.register(ChatMessageOtherTableViewCell.nib(), forCellReuseIdentifier: ChatMessageOtherTableViewCell.toString())
        tableView.register(ChatMessageSelfTableViewCell.nib(), forCellReuseIdentifier: ChatMessageSelfTableViewCell.toString())
        
        tableView.separatorColor = UIColor.clear
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 48, 0)
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 48, 0)
        
        let bottomIndexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: bottomIndexPath, at: .bottom, animated: false)
    }
    
    func setupChatBarView() {
        chatBarViewPlaceholder.backgroundColor = UIColor.clear
        chatBarView = ChatBarView.instanceFromNib() as! ChatBarView
        self.view.addSubview(chatBarView)
        NSLayoutConstraint.activate([
            chatBarView.topAnchor.constraint(equalTo: chatBarViewPlaceholder.topAnchor),
            chatBarView.bottomAnchor.constraint(equalTo: chatBarViewPlaceholder.bottomAnchor),
            chatBarView.leftAnchor.constraint(equalTo: chatBarViewPlaceholder.leftAnchor),
            chatBarView.rightAnchor.constraint(equalTo: chatBarViewPlaceholder.rightAnchor)])
    }
    
}

// MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped on row")
    }
    
}

// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageSelfTableViewCell.toString(), for: indexPath) as! ChatMessageSelfTableViewCell
            cell.set(text: message.text)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageOtherTableViewCell.toString(), for: indexPath) as! ChatMessageOtherTableViewCell
            cell.set(text: message.text)
            return cell
        }
    }
    
}

// MARK: - TEST DATA
extension ChatViewController {
    
    func TESTmessages() -> [Message] {
        var newMessages: [Message] = []
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world."))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world Hello world. Hello world Hello world Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world Hello world Hello world Hello world Hello world Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world."))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world Hello world. Hello world Hello world Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world Hello world Hello world Hello world Hello world Hello world. Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        newMessages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        return newMessages
    }
    
}
