//
//  NetworkingRouter.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkingRouter {
    case getChat
    case showChat(id: String)
    case sendChat(chatID: String, text: String)
    
    public var baseURL: String {
        return "https://customer-service-backend.herokuapp.com"
    }
    
    public var path: String {
        switch self {
        case .getChat:
            return "/chat"
        case .showChat(let id):
            return "/chat/\(id)"
        case .sendChat(let chatID, let _):
            return "/chat/\(chatID)/messages"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getChat, .showChat:
            return .get
        case .sendChat:
            return .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getChat, .showChat:
            return nil
        case .sendChat:
            return ["Content-type": "application/json"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getChat, .showChat:
            return nil
        case .sendChat(let _, let text):
            return ["text": text, "fromUser": false]
        }
    }
}
