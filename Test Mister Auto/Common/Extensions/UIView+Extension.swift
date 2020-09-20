//
//  UIView+Extension.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import UIKit

extension UIView {
    
    public static var className: String {
        let className = "\(self)"
        let components = className.split { $0 == "." }.map(String.init)
        guard let name = components.last else {
            fatalError("Could not find className for \(className)")
        }
        return name
    }
}
