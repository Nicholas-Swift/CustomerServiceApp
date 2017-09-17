//
//  MainFeedSocketController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SocketIO
import SwiftyJSON

protocol MainFeedSocketControllerDelegate: class {
    func newChatWasAdded(chat: Chat)
}

class MainFeedSocketController {
    
    // MARK: - Instance Vars
    weak var delegate: MainFeedSocketControllerDelegate?
    let socket: SocketIOClient
    
    // MARK: - Init
    init() {
        socket = SocketIOClient(socketURL: URL(string: "https://customer-service-backend.herokuapp.com")!, config: [.log(true), .compress])
        
        socket.on(clientEvent: .connect) { data, ack in
            
            // On connect, connect to room
            print("socket connected")
        }
        
        socket.on("newMessage") { [weak self] data, ack in
            let json = JSON(data)
            print(json)
            
            var newChat = Chat(json: json[0]["chat"])!
            newChat.isUnread = true
            self?.delegate?.newChatWasAdded(chat: newChat)
        }
        
        socket.connect()
    }
    
}
