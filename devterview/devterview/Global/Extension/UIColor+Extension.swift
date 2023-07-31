//
//  UIColor+Extension.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/25.
//

import UIKit

extension UIColor {
    
    // MARK: - BackgroundColor
    
    static var backgroundDark: UIColor {
        return UIColor(hex: "#17171B")
    }
    
    static var lightDark: UIColor {
        return UIColor(hex: "#2E2E36")
    }
    
    // MARK: - MainColor
    
    static var mainBule: UIColor {
        return UIColor(hex: "#3843D0")
    }
    
    static var mainPink: UIColor {
        return UIColor(hex: "#FF80A9")
    }
    
    static var mainYellow: UIColor {
        return UIColor(hex: "#FFC466")
    }
    
    static var mainSkyblue: UIColor {
        return UIColor(hex: "#8EA1FF")
    }
    
    static var mainGreen: UIColor {
        return UIColor(hex: "#6ECFBC")
    }
    
    static var mainOrange: UIColor {
        return UIColor(hex: "#F8623F")
    }
    
    static var mainPurple: UIColor {
        return UIColor(hex: "#8E59FF")
    }
    
    // MARK: - SubColor
    
    static var gray: UIColor {
        return UIColor(hex: "#BABABA")
    }

}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
