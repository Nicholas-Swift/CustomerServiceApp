//
//  Message.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Message {
    
    // MARK: - Instance Vars
    let id: String
    let text: String
    let updatedAt: Date
    let fromUser: Bool
    
    // MARK: - Init
    init?(json: JSON) {
        guard
            let id = json["_id"].string,
            let text = json["text"].string,
            let fromUser = json["fromUser"].bool
        else {
            return nil
        }
        let updatedAt = json["updatedAt"].dateValue
        
        self.init(id: id, text: text, updatedAt: updatedAt, fromUser: fromUser)
    }
    
    init(id: String, text: String, updatedAt: Date, fromUser: Bool) {
        self.id = id
        self.text = text
        self.updatedAt = updatedAt
        self.fromUser = fromUser
    }
    
    init(text: String) {
        self.id = ""
        self.text = text
        self.updatedAt = Date()
        self.fromUser = false
    }
}
