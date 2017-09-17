//
//  JSON+Date.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import Foundation
import SwiftyJSON

//extension JSON {
//    
//    public var date: Date? {
//        get {
//            switch self.type {
//            case .string:
//                return Formatter.jsonDateTimeFormatter.date(from: self.object as! String)
//            default:
//                return nil
//            }
//        }
//    }
//    
//    public var dateValue: Date {
//        get {
//            return date!
//        }
//    }
//    
//    public var dateTime: Date? {
//        get {
//            switch self.type {
//            case .string:
//                return Formatter.jsonDateTimeFormatter.date(from: self.object as! String)
//            default:
//                return nil
//            }
//        }
//    }
//    
//}
//
//class Formatter {
//    
//    private static var internalJsonDateFormatter: DateFormatter?
//    private static var internalJsonDateTimeFormatter: DateFormatter?
//    
//    static var jsonDateFormatter: DateFormatter {
//        if (internalJsonDateFormatter == nil) {
//            internalJsonDateFormatter = DateFormatter()
//            internalJsonDateFormatter!.dateFormat = "yyyy-MM-dd"
//        }
//        return internalJsonDateFormatter!
//    }
//    
//    // 2017-09-17T07:43:41.315Z
//    
//    static var jsonDateTimeFormatter: DateFormatter {
//        if (internalJsonDateTimeFormatter == nil) {
//            internalJsonDateTimeFormatter = DateFormatter()
//            internalJsonDateTimeFormatter!.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ"
//        }
//        return internalJsonDateTimeFormatter!
//    }
//    
//}
