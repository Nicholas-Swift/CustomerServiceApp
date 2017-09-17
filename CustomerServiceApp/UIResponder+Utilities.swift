//
//  UIResponder+Utilities.swift
//  CustomerServiceApp
//
//  Created by Nicholas Swift on 9/16/17.
//  Copyright © 2017 Nicholas Swift. All rights reserved.
//

import UIKit

extension UIResponder {
    
    // To String
    class func toString() -> String {
        let name = NSStringFromClass(self)
        let components = name.components(separatedBy: ".")
        
        guard let classString = components.last else {
            fatalError("Error: couldn't convert class name to string.")
        }
        
        return classString
    }
    
    // Nib named
    class func nibNamed(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    // Nib
    class func nib() -> UINib {
        return nibNamed(nibName: self.toString())
    }
    
    // Instance from nib
    class func instanceFromNib() -> UIView {
        let view = nib().instantiate(withOwner: nil, options: nil)[0] as! UIView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIViewController {
    // Instance from nib
    class func controllerFromNib() -> UIViewController {
        let view = nib().instantiate(withOwner: nil, options: nil)[0] as! UIViewController
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
