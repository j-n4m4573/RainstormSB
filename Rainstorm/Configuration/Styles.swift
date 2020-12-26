//
//  Styles.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 12/21/20.
//

import UIKit

extension UIColor {
    
    static let base: UIColor = UIColor(red: 0.31, green: 0.72, blue: 0.83, alpha: 1.0)
    
    static var baseTextColor: UIColor {
        return base
    }
    
    static var baseBackgroundColor: UIColor {
        return base
    }
    
    
}

extension UIFont {
    
    enum Rainstorm {
        
        static let lightRegular: UIFont = .systemFont(ofSize: 17.0, weight: .light)
        static let lightSmall: UIFont = .systemFont(ofSize: 15.0, weight: .light)
        static let heavyLarge: UIFont = .systemFont(ofSize: 20.0, weight: .heavy)

    }
}
