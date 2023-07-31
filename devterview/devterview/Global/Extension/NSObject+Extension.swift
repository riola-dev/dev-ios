//
//  NSObject+Extension.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/25.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
