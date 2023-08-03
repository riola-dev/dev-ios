//
//  BasicLabe.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/29.
//

import UIKit

class BasicLabel: UILabel {

    private let contentText: String
    private let fontStyle: FontType
    private let textColorInfo: UIColor

    init(contentText: String, fontStyle: FontType, textColorInfo: UIColor) {
        self.contentText = contentText
        self.fontStyle = fontStyle
        self.textColorInfo = textColorInfo
        super.init(frame: .zero)

        self.text = contentText
        self.font = UIFont.setFont(fontStyle)
        self.textColor = textColorInfo
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
//        addLabelSpacing(kernValue: 0, lineSpacing: 5)
        setLabelLineHeight(text: nil, lineHeight: 5)
    }

}
