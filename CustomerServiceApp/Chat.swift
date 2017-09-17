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
    let type: String
    
    var isUnread: Bool = false
    
    // MARK: - Inits
    init?(json: JSON) {
        guard
            let id = json["_id"].string,
            let user = User(json: json["chatUser"]),
            let updatedAt = json["updatedAt"].string?.toISO8601Date,
            let type = json["type"].string
        else {
            return nil
        }
        let allMessages = json["messages"].arrayValue.flatMap { Message(json: $0) }
        let lastMessage = Message(text: json["lastMessage"].stringValue)
        let messages = allMessages.isEmpty ? [lastMessage] : allMessages
        
        
        self.init(id: id, user: user, messages: messages, updatedAt: updatedAt, type: type)
    }
    
    init(id: String, user: User, messages: [Message], updatedAt: Date, type: String) {
        self.id = id
        self.user = user
        self.messages = messages
        self.updatedAt = updatedAt
        self.type = type
    }
}
