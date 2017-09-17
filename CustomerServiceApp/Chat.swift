//
//  Chat.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Chat {
    
    // MARK: - Instance Vars
    let id: String
    let user: User
    let messages: [Message]
    let updatedAt: Date
    
    // MARK: - Inits
    init?(json: JSON) {
        guard
            let id = json["_id"].string,
            let user = User(json: json)
        else {
            return nil
        }
        let allMessages = json["messages"].arrayValue.flatMap { Message(json: $0) }
        let lastMessage = Message(text: json["lastMessage"].stringValue)
        let messages = allMessages.isEmpty ? [lastMessage] : allMessages
        let updatedAt = json["updatedAt"].dateValue
        
        self.init(id: id, user: user, messages: messages, updatedAt: updatedAt)
    }
    
    init(id: String, user: User, messages: [Message], updatedAt: Date) {
        self.id = id
        self.user = user
        self.messages = messages
        self.updatedAt = updatedAt
    }
}
