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
    case chat
    
    public var baseURL: String {
        return "https://customer-service-backend.herokuapp.com"
    }
    
    public var path: String {
        switch self {
        case .chat:
            return "/chat"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .chat:
            return .get
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .chat:
            return [:]
        }
        //return ["Content-type": "application/json"]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .chat:
            return [:]
        }
    }
}
