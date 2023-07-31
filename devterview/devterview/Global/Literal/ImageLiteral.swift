//
//  ImageLiteral.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit

enum ImageLiteral {
    
    // MARK: -  SF Symbols
    
    static var xmarkSymbol: UIImage { .load(systemName: "xmark") }
    static var musicmicSymbol: UIImage { .load(systemName: "music.mic") }
    static var twoBubbleSymbol: UIImage { .load(systemName: "bubble.left.and.bubble.right.fill") }
    static var cmaeraFillSymbol: UIImage { .load(systemName: "camera.fill") }
    static var checkMarkCircleFillSymbol: UIImage { .load(systemName: "checkmark.circle.fill") }
    static var checkmarkCircleSymbol: UIImage { .load(systemName: "checkmark.circle") }
    static var chevronRightSymbol: UIImage { .load(systemName: "chevron.right") }
    
    // MARK: -  SF Symbols
    static var scoreBackgroundImage = UIImage(named: "scoreBackgroundImage")
    
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
