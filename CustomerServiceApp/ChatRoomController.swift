//
//  ChatRoomController.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SocketIO
import SwiftyJSON

protocol ChatRoomControllerDelegate: class {
    func otherMessageWasAdded(with message: Message)
}

class ChatRoomController {
    
    // MARK: - Instance Vars
    weak var delegate: ChatRoomControllerDelegate?
    let socket: SocketIOClient
    
    // MARK: - Init
    init(chat: Chat) {
        socket = SocketIOClient(socketURL: URL(string: "https://customer-service-backend.herokuapp.com")!, config: [.log(true), .compress])
        
        socket.on(clientEvent: .connect) { [weak self] data, ack in
            
            // On connect, connect to room
            print("socket connected")
            
            self?.socket.joinNamespace(chat.id)
        }
        
        
        
        socket.on("newMessage") { [weak self] data, ack in
            
            let json = JSON(data)
            print(json)
            
            let newMessage = Message(json: json)!
            self?.delegate?.otherMessageWasAdded(with: newMessage)
            
//            if let cur = data[0] as? Double {
//                self?.socket.emitWithAck("canUpdate", cur).timingOut(after: 0) { [weak self] data in
//                    self?.socket.emit("update", ["amount": cur + 2.50])
//                }
//                
//                ack.with("Got your currentAmount", "dude")
//            }
        }
        
        socket.on("read") { [weak self] data, ack in
            
            let json = JSON(data)
            print(json)
            
        }
        
        socket.connect()
    }
    
}
