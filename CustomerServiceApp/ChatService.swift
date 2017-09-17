//
//  ChatService.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SwiftyJSON

class ChatService {
    
    static func getChats(completionHandler: @escaping (([Chat]) -> Void)) {
        NetworkingProvider.request(router: NetworkingRouter.getChat) { (data: Any) in
            let json = JSON(data)
            let chats = json.arrayValue.flatMap { Chat(json: $0) }
            completionHandler(chats)
        }
    }
    
    static func showChat(id: String, completionHandler: @escaping ((Chat) -> Void)) {
        NetworkingProvider.request(router: NetworkingRouter.showChat(id: id)) { (data: Any) in
            let json = JSON(data)
            if let chat = Chat(json: json) {
                completionHandler(chat)
            } else {
                fatalError("No chat was returned")
            }
        }
    }
    
}
