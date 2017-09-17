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
    var chat: Chat?
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatBarViewPlaceholder: UIView!
    var chatBarView: ChatBarView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: self.view.window)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - Setup Models
extension ChatViewController {
    
    func setupModels(oldChat: Chat) {
        navigationItem.title = oldChat.user.name
        ChatService.showChat(id: oldChat.id) { [weak self] (chat: Chat) in
            self?.chat = chat
            self?.tableView.reloadData()
            let bottomIndexPath = IndexPath(row: chat.messages.count - 1, section: 0)
            self?.tableView.scrollToRow(at: bottomIndexPath, at: .bottom, animated: false)
        }
    }
    
}

// MARK: - Setup Views
extension ChatViewController {
    
    func setupViews() {
        setupTableView()
        setupChatBarView()
        setupKeyboard()
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
    }
    
    func setupChatBarView() {
        chatBarViewPlaceholder.backgroundColor = UIColor.clear
        chatBarView = ChatBarView.instanceFromNib() as! ChatBarView
        chatBarView.delegate = self
        self.view.addSubview(chatBarView)
        NSLayoutConstraint.activate([
            chatBarView.topAnchor.constraint(equalTo: chatBarViewPlaceholder.topAnchor),
            chatBarView.bottomAnchor.constraint(equalTo: chatBarViewPlaceholder.bottomAnchor),
            chatBarView.leftAnchor.constraint(equalTo: chatBarViewPlaceholder.leftAnchor),
            chatBarView.rightAnchor.constraint(equalTo: chatBarViewPlaceholder.rightAnchor)])
    }
    
}

// MARK: - Keyboard
extension ChatViewController {
    
    func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: .UIKeyboardWillShow , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: .UIKeyboardWillHide , object: nil)
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        let keyboardSize: CGSize = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        let height = min(keyboardSize.height, keyboardSize.width)
        shrinkDisplay(height)
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        enlargeDisplay()
    }
    
    func shrinkDisplay(_ height: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - height)
        }
    }
    
    func enlargeDisplay() {
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: UIScreen.main.bounds.height)
        }
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
        return chat?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = chat!.messages[indexPath.row]
        let nextMessage = indexPath.row + 1 < chat!.messages.count ? chat!.messages[indexPath.row + 1] : nil
        if message.fromUser {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageOtherTableViewCell.toString(), for: indexPath) as! ChatMessageOtherTableViewCell
            cell.setupModel(message: message, nextMessage: nextMessage)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageSelfTableViewCell.toString(), for: indexPath) as! ChatMessageSelfTableViewCell
            cell.setupModel(message: message)
            return cell
        }
    }
    
}

// MARK: - ChatBarViewDelegate
extension ChatViewController: ChatBarViewDelegate {
    
    func chatBarView(_ chatBarView: ChatBarView, sent text: String) {
        
        // Send stuff
        if let chat = chat {
            ChatService.sendChat(chatID: chat.id, text: text)
        }
        chatBarView.textTextField.resignFirstResponder()
    }
    
}
