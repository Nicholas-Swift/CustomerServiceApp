//
//  NetworkingProvider.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingProvider {
    
    static func request(router: NetworkingRouter, completionHandler: @escaping ((Any) -> Void)) {
        let url = router.baseURL + router.path
        Alamofire.request(url, method: router.method, parameters: router.parameters, encoding: JSONEncoding.default, headers: router.headers).responseJSON { response in
            switch (response.result) {
            case .success(let value):
                completionHandler(value)
            case.failure(let error):
                assertionFailure("There was an error with the network request")
                completionHandler(error)
            }
        }
    }
    
}
