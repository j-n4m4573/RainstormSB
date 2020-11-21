//
//  UIViewController.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/20/20.
//

import UIKit

extension UIViewController {
    
    // MARK: Static Properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
}
