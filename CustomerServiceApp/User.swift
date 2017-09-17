//
//  User.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    // MARK: - Instance Vars
    let id: String
    let name: String
    
    // MARK: - Inits
    init?(json: JSON) {
        guard
            let id = json["_id"].string,
            let name = json["name"].string
        else {
            return nil
        }
        self.init(id: id, name: name)
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
