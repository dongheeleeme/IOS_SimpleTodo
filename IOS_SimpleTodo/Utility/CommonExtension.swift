//
//  UIView+Extension.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/21.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

extension UIView {
    
    static var reuseIdentifier: String {
        let nameSpaceClassName = NSStringFromClass(self)
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return nameSpaceClassName
        }
        return className
    }
}

extension UIViewController {
    
    static var reuseIdentifier: String {
        let nameSpaceClassName = NSStringFromClass(self)
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return nameSpaceClassName
        }
        return className
    }
}
