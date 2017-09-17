//
//  ChatService.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation

class ChatService {
    
    static func getChats() {
        NetworkingProvider.request(router: NetworkingRouter.chat)
    }
    
    static func showChat(id: String) {
        
    }
    
}
