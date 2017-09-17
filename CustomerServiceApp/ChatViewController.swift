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
    @IBOutlet weak var chatBarView: UIView!
    
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
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world."))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world Hello world. Hello world Hello world Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world Hello world Hello world Hello world Hello world Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world."))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world. Hello world Hello world. Hello world Hello world Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world Hello world Hello world Hello world Hello world Hello world. Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world"))
        messages.append(Message(text: "Hello world. Hello world. Hello world. Hello world. Hello world. Hello world"))
    }
    
}

// MARK: - Setup Views
extension ChatViewController {
    
    func setupViews() {
        
        // Navigation Item
        navigationItem.title = "Brian Hans"
        
        // Table View
        tableView.register(ChatMessageOtherTableViewCell.nib(), forCellReuseIdentifier: ChatMessageOtherTableViewCell.toString())
        tableView.register(ChatMessageSelfTableViewCell.nib(), forCellReuseIdentifier: ChatMessageSelfTableViewCell.toString())
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
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
