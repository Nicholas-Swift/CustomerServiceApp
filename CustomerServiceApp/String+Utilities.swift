//
//  String+Utilities.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/17/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation

extension String {
    
    var toISO8601Date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
        
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        let timeZone = NSTimeZone.local
        let seconds = timeZone.secondsFromGMT(for: date)
        return Date(timeInterval: TimeInterval(seconds), since: date)
    }
}
