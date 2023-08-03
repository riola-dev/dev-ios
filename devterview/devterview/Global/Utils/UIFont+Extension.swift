//
//  UIFont+Extension.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/29.
//

import UIKit

enum FontType {
    case gmarketTitle
    case largeTitle01
    case largeTitle02
    case largeTitle03
    case headline01Black
    case headline01Bold
    case headline01Regular
    case content01Bold
    case content01Regular
    case content01Light
    case content02Bold
    case content02Regular
    case content02Light
    case captionRegualr
    case captionMedium
}

extension UIFont {
    static func setFont(_ type: FontType) -> UIFont {
        switch type {
        
        // MARK: - Title
        
        case .gmarketTitle:
            return UIFont(name: "GmarketSansBold", size: 22) ?? systemFont(ofSize: 22, weight: .bold)
        case .largeTitle01:
            return systemFont(ofSize: 30, weight: .bold)
        case .largeTitle02:
            return systemFont(ofSize: 24, weight: .bold)
        case .largeTitle03:
            return systemFont(ofSize: 20, weight: .bold)
        
        // MARK: - Headline
        
        case .headline01Black:
            return systemFont(ofSize: 18, weight: .black)
        case .headline01Bold:
            return systemFont(ofSize: 18, weight: .bold)
        case .headline01Regular:
            return systemFont(ofSize: 18, weight: .regular)
            
        // MARK: - content
        
        case .content01Bold:
            return systemFont(ofSize: 16, weight: .bold)
        case .content01Regular:
            return systemFont(ofSize: 16, weight: .regular)
        case .content01Light:
            return systemFont(ofSize: 16, weight: .light)
        case .content02Bold:
            return systemFont(ofSize: 14, weight: .bold)
        case .content02Regular:
            return systemFont(ofSize: 14, weight: .regular)
        case .content02Light:
            return systemFont(ofSize: 14, weight: .light)
            
        // MARK: - content
        
        case .captionRegualr:
            return systemFont(ofSize: 12, weight: .regular)
        case .captionMedium:
            return systemFont(ofSize: 12, weight: .medium)
        }
    }
}
